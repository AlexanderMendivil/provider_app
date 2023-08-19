import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/src/widgets/list_news.dart';

import '../services/news_service.dart';

class Tab1Screen extends StatelessWidget {
   
  const Tab1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
     
    return Scaffold(
      body: NewsList(news: newsService.headlines)
    );
  }
}