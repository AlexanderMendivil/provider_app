import 'package:flutter/material.dart';
import 'package:provider_app/src/models/news_model.dart';
import 'package:provider_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;
  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
      return _NewsItem(notice: news[index], index: index);
    });
  }
}

class _NewsItem extends StatelessWidget {
  final Article notice;
  final int index;
  const _NewsItem({required this.notice, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarTarget(notice: notice, index: index,),
        _TitleTarjet(notice: notice,),
        _ImageTarjet(notice: notice,),
        _BodyTarjet(notice: notice,),
        const _ButtonsTarjet(),
        const SizedBox(height: 10,),
        const Divider()
      ],
    );
  }
}

class _ButtonsTarjet extends StatelessWidget {
  const _ButtonsTarjet();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
        onPressed: (){},
        fillColor: myTheme.primaryColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(Icons.star_border),
      ),
      const SizedBox(width: 10,),
        RawMaterialButton(
        onPressed: (){},
        fillColor: Colors.blue,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Icon(Icons.more),
      ),
      ],
    );
  }
}

class _BodyTarjet extends StatelessWidget {
  final Article notice;
  const _BodyTarjet({
    required this.notice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(notice.description != null ? notice.description! : ''),
    );
  }
}

class _ImageTarjet extends StatelessWidget {
  final Article notice;
  const _ImageTarjet({
    required this.notice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: 
          notice.urlToImage != null ?
          FadeInImage(
            placeholder: const AssetImage('assets/img/giphy.gif'), 
            image: NetworkImage(notice.urlToImage!))
            :const Image(image: AssetImage('assets/img/no-image.png'),)
            ),
      ),
    );
  }
}

class _TitleTarjet extends StatelessWidget {

  final Article notice;
  const _TitleTarjet({
    required this.notice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(notice.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
    );
  }
}

class _TopBarTarget extends StatelessWidget {
  final Article notice;
  final int index;
  const _TopBarTarget({
    required this.notice, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${ index + 1 } - ', style: TextStyle(color: myTheme.primaryColor),),
          Text('${notice.source.name}.'),
        ],
      ),
    );
  }
}