import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/presentation/news/list_news/list_news_item/list_news_item.dart';

class ListNewsItems extends StatelessWidget {
  final List<News> news;

  const ListNewsItems({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListNewsItem> listNewsItem = [];

    for (var value in news) {
      listNewsItem.add(ListNewsItem(
        news: value,
        margin: 5,
      ));
    }

    return Wrap(direction: Axis.horizontal,  children: [...listNewsItem]);
  }
}
