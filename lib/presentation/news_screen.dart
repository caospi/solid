import 'package:flutter/material.dart';
import 'package:solid/presentation/news_controllers.dart';

class NewsScreen extends StatefulWidget {
  final NewsController newsController;
  const NewsScreen({super.key, required this.newsController});
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
    final data = await widget.newsController.loadNews();
    setState(() {
      news = data;
    });
  }

  void saveFavorites(String article) async {
    final favorites = await widget.newsController.toggleFavorites(article);
    setState(() {
      this.favorites = favorites;
    });
  }

  void loadFavorites() async {
    favorites = await widget.newsController.favoritesRepository.loadFavorites();
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
              color: favorites.contains(news[i]) ? Colors.red : null,
            ),
            onPressed: () => saveFavorites(news[i]),
          ),
        ),
      ),
    );
  }
}
