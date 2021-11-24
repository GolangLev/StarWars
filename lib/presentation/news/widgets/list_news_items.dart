import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/news.dart';

import 'list_news_item.dart';

class ListNewsItems extends StatelessWidget {
  final List<News> news;

  const ListNewsItems({required this.news, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListNewsItem> listNewsItem = [];

    news.forEach((News value) {
      listNewsItem.add(ListNewsItem(news: value));
    });

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [...listNewsItem],
      ),
    );
  }
}
