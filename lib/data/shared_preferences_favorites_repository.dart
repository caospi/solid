import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid/repository/favorites_repository.dart';

class SharedPreferencesFavoritesRepository implements FavoritesRepository {
  static const _key = 'favorites';

  @override
  Future<List<String>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_key) ?? [];
    return favorites;
  }

  @override
  Future<void> saveFavorites(List<String> articles) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, articles);
  }
}
