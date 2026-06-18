import 'package:solid/repository/favorites_repository.dart';
import 'package:solid/repository/news_repository.dart';

class NewsController {
  final NewsRepository newsRepository;
  final FavoritesRepository favoritesRepository;

  NewsController({
    required this.newsRepository,
    required this.favoritesRepository,
  });

  Future<List<String>> loadNews() async {
    return newsRepository.getNews();
  }

  Future<List<String>> loadFavorites() async {
    return favoritesRepository.loadFavorites();
  }

  Future<List<String>> toggleFavorites(String article) async {
    List<String> favorites = await favoritesRepository.loadFavorites();
    favorites.contains(article)
        ? favorites.remove(article)
        : favorites.add(article);

    favoritesRepository.saveFavorites(favorites);

    return favorites;
  }
}
