import 'package:flutter/material.dart';
import 'package:mvvm_fresh_news/pages/news_article_detail.dart';
import 'package:mvvm_fresh_news/viewmodels/news_article_list_view_model.dart';
import 'package:mvvm_fresh_news/viewmodels/news_article_view_model.dart';
import 'package:mvvm_fresh_news/widgets/news_list.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopeadlines();
  }

  Widget _buildList(
      NewsArticleListViewModel newsArticleListViewModel, BuildContext context) {
    switch (newsArticleListViewModel.loadingStatus) {
      case LoadingStatus.searching:
        return Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
        break;
      case LoadingStatus.empty:
        return Align(
            alignment: Alignment.center, child: Text("No results found!"));
        break;
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
            articles: newsArticleListViewModel.articles,
            onSelected: (article) {
              _showNewsArticleDetail(context, article);
            },
          ),
        );
        break;
      default:
        return Container();
    }
  }

  void _showNewsArticleDetail(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticleDetailsPage(article: article)));
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Latest News"),
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  viewModel.search(value);
                }
              },
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter search term",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
            _buildList(viewModel, context)
          ],
        ));
  }
}
