import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/news.dart';

class ListNewsItem extends StatelessWidget {
  final News news;

  const ListNewsItem({required this.news, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        height: 56,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${news.title}', style: TextStyle(color: Colors.white)),
            Text('SubTitle: ${news.subTitle}', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
