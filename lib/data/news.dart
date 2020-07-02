import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/news.dart';

class NewsApi {
  int currentIndex = 0;
  int maxCount = 10;

  Future<List<News>> getNews({List<News> oldNews}) async {
    var news = oldNews ?? <News>[];
    Map<String, String> queryParams = {
      'index': currentIndex.toString(),
      'count': maxCount.toString()
    };
    final Uri uri = Uri.https('www.pokemon.com', '/us/api/news', queryParams);

    http.Response response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      news.addAll(newsFromJson(utf8.decode(response.bodyBytes)));
    } else {
      throw NewsException('${response.statusCode}: ${response.reasonPhrase}');
    }

    return news;
  }

  String cleanTitle(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}

class NewsException implements Exception {
  final String message;

  NewsException([this.message]);
}
