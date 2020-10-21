import 'package:flutter/material.dart';
import 'package:mvvm_fresh_news/models/news_article.dart';
import 'package:mvvm_fresh_news/services/remote_services.dart';
import 'package:mvvm_fresh_news/viewmodels/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  var loadingStatus = LoadingStatus.searching;
  void populateTopeadlines() async {
    List<NewsArticle> newsArticles = await RemoteService().fetchTopHeadlines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticle =
        await RemoteService().searchHeadlineByKeyWord(keyword);
    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
