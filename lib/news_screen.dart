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
  List<String> favs = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
    loadFavorites();
  }

  // Este método hace de todo: Conecta, procesa y maneja errores
  Future<void> fetchNews() async {
    final response = await http.get(
      Uri.parse(
        'https://api.rss2json.com/v1/api.json?rss_url=https://feeds.bbci.co.uk/mundo/rss.xml',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['items'];
      print(results);
      setState(() {
        results.forEach((n) {
          news.add(n['title']);
        });
      });
    }
  }

  // Lógica de negocio mezclada con persistencia local
  void saveFavorites(String article) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favs = prefs.getStringList('favs') ?? [];
    favs.contains(article) ? favs.remove(article) : favs.add(article);
    await prefs.setStringList('favs', favs);

    this.favs = favs;
    setState(() {});
  }

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favs = prefs.getStringList('favs') ?? [];
    this.favs = favs;
    setState(() {});
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
              color: favs.contains(news[i]) ? Colors.red : null,
            ),
            onPressed: () => saveFavorites(news[i]),
          ),
        ),
      ),
    );
  }
}
