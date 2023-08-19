import 'package:flutter/material.dart';
import 'package:provider_app/src/models/news_model.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;
  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
      return Text(news[index].title);
    });
  }
}