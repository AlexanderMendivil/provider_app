import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider_app/src/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  NewsService(){
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url  = '${dotenv.get('API_URL')}top-headlines?country=us&apiKey=${dotenv.get('API_KEY')}';
    final res = await http.get(Uri.parse(url));

    final NewsModel newsResponse = newsModelFromJson(res.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}