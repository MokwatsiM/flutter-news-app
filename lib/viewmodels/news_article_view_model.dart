import 'package:mvvm_fresh_news/models/news_article.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get title => _newsArticle.title;
  String get description => _newsArticle.description;
  String get imageUrl => _newsArticle.urlToImage;
  String get url => _newsArticle.url;
  String get author => _newsArticle.author;
  String get content => _newsArticle.content;
  String get sourceName => _newsArticle.source.name;
}
