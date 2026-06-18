import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solid/repository/news_repository.dart';

class BbcNewsRepository implements NewsRepository {
  @override
  Future<List<String>> getNews() async {
    List<String> news = [];
    final response = await http.get(
      Uri.parse(
        'https://api.rss2json.com/v1/api.json?rss_url=https://feeds.bbci.co.uk/mundo/rss.xml',
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['items'];
        results.forEach((n) {
          news.add(n['title']);
        });
    }

    return news;
  }
}
