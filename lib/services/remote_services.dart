import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_fresh_news/models/news_article.dart';
import 'package:mvvm_fresh_news/utils/constants.dart';

class RemoteService {
  Future<List<NewsArticle>> searchHeadlineByKeyWord(String keyWord) async {
    final response = await http.get(Constants.headlinesFor(keyWord));
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      Iterable list = results['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to retrieve topheadlines");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await http
        .get(Constants.TOP_NEWS_BASE_URL + Constants.TOP_HEADLINES_URL);
    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      Iterable articles = results["articles"];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to retried top headlines");
    }
  }
}
