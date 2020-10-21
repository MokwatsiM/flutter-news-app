import 'package:flutter/material.dart';
import 'package:mvvm_fresh_news/viewmodels/news_article_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;
  NewsArticleDetailsPage({this.article});
  @override
  Widget build(BuildContext context) {
    print(article.url);
    return Scaffold(
      appBar: AppBar(
        title: Text("${article.title}"),
      ),
      body: WebView(
        initialUrl: article.url,
      ),
    );
  }
}
