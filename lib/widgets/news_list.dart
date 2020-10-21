import 'package:flutter/material.dart';
import 'package:mvvm_fresh_news/models/news_article.dart';
import 'package:mvvm_fresh_news/pages/news_article_detail.dart';
import 'package:mvvm_fresh_news/viewmodels/news_article_view_model.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;
  NewsList({this.articles, this.onSelected});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        final article = articles[index];
        return ListTile(
            onTap: () {
              this.onSelected(article);
            },
            leading: Container(
              width: 100,
              height: 100,
              child: article.imageUrl != null
                  ? Image.network(
                      article.imageUrl,
                    )
                  : Image.asset("images/countryplaceholder.png"),
            ),
            title: Text(article.title));
      },
    );
  }
}
