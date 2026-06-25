import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {
  List<String> news = [];
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
    loadFavorites();
  }

  Future<void> fetchNews() async {
    final response = await http.get(
      Uri.parse(
        'https://api.rss2json.com/v1/api.json?rss_url=https://feeds.bbci.co.uk/mundo/rss.xml',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['items'];
      setState(() {
        results.forEach((n) {
          news.add(n['title']);
        });
      });
    }
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    setState(() {
      this.favorites = favorites;
    });
  }

  void saveFavorites(String article) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];
    favorites.contains(article)
        ? favorites.remove(article)
        : favorites.add(article);
    await prefs.setStringList('favorites', favorites);

    setState(() {
      this.favorites = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(news[i]),
          trailing: IconButton(
            icon: Icon(
              Icons.favorite,
              color: favorites.contains(news[i]) ? Colors.red : null,
            ),
            onPressed: () => saveFavorites(news[i]),
          ),
        ),
      ),
    );
  }
}
