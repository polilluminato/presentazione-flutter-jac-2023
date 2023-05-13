import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_jac/models/article.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  NewsRepository();

  Future<List<Article>?> getArticleList() async {
    var response = await http.get(
      Uri.parse(
          "${dotenv.env['NEWS_API_URL']}/top-headlines?country=it&category=technology"),
      headers: {
        'Content-Type': 'application/json',
        'X-Api-Key': dotenv.env['NEWS_API_KEY']!,
      },
    );

    final responseBodyParsed = json.decode(response.body);

    return responseBodyParsed["articles"]
        .map<Article>((json) => Article.fromJson(json))
        .toList();
  }
}
