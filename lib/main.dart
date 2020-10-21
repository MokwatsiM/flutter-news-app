import 'package:flutter/material.dart';
import 'package:mvvm_fresh_news/pages/news_Page_list.dart';
import 'package:mvvm_fresh_news/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Fresh News",
        home: ChangeNotifierProvider(
          create: (BuildContext context) => NewsArticleListViewModel(),
          child: NewsListPage(),
        ));
  }
}
