import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/src/models/category_model.dart';
import 'package:provider_app/src/services/news_service.dart';

class Tab2Screen extends StatelessWidget {
   
  const Tab2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: _CategoryList())
          ],
        )
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {

  const _CategoryList();

  @override
  Widget build(BuildContext context) {
  final categories = Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
    itemCount: categories.length,
      itemBuilder: (BuildContext context, int index){
      return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _CategoryButton(category: categories[index],),
            const SizedBox(height: 5,),
            Text('${categories[index].name[0].toUpperCase()}${categories[index].name.substring(1)}', style: const TextStyle(fontSize: 15)),
          ],
        )
      );
    },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(category.icon, color: Colors.black54,),
    
      ),
    );
  }
}