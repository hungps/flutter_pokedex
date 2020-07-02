import 'package:flutter/material.dart';
import 'package:pokedex/data/news.dart';
import 'package:pokedex/models/news.dart';

import '../../../widgets/poke_news.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<News> news;
  NewsApi newsApi;
  @override
  void initState() {
    newsApi = NewsApi();
    newsApi.getNews().then((value) {
      setState(() {
        news = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return news == null
        ? Center(child: CircularProgressIndicator())
        : ListView.separated(
            shrinkWrap: true,
            itemCount: news.length,
            separatorBuilder: (context, index) => Divider(),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              News currentNews = news[index];
              return PokeNews(
                title: newsApi.cleanTitle(currentNews.title),
                time: currentNews.date,
                thumbnail: Image.network(currentNews.image),
              );
            },
          );
  }
}
