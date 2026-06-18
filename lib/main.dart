import 'package:flutter/material.dart';
import 'package:solid/data/bbc_news_repository.dart';
import 'package:solid/data/shared_preferences_favorites_repository.dart';
import 'package:solid/presentation/news_controllers.dart';
import 'package:solid/presentation/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final newsController = NewsController(
      newsRepository: BbcNewsRepository(),
      favoritesRepository: SharedPreferencesFavoritesRepository(),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NewsScreen(newsController: newsController),
    );
  }
}
