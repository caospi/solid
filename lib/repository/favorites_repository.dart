abstract class FavoritesRepository {
  Future<List<String>> loadFavorites();
  Future<void> saveFavorites(List<String> articles);
}
