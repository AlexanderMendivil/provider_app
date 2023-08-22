import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider_app/src/models/category_model.dart';
import 'package:provider_app/src/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier{

  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  String _selectedCategory = 'business';

  Map<String, List<Article>> categoryArticles = {};
   

  NewsService(){
    getTopHeadlines();
    categories.forEach((element) { 
      categoryArticles[element.name] = [];
    });
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value){
    _selectedCategory = value;
    getArticlesByCategory(value); 
    notifyListeners();
  }
  getTopHeadlines() async {
    final url  = '${dotenv.get('API_URL')}top-headlines?country=us&apiKey=${dotenv.get('API_KEY')}';
    final res = await http.get(Uri.parse(url));

    final NewsModel newsResponse = newsModelFromJson(res.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  List<Article> get getArticlesBySelectedCategory => categoryArticles[selectedCategory]!;
  
  void getArticlesByCategory(String category) async {
    if(categoryArticles[category] !.isNotEmpty){
      return;
    }
    final url  = '${dotenv.get('API_URL')}top-headlines?country=us&apiKey=${dotenv.get('API_KEY')}&category=$category';
    final res = await http.get(Uri.parse(url));
    final NewsModel newsResponse = newsModelFromJson(res.body);

    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}