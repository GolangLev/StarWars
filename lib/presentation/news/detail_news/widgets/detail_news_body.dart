import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/description/description_post.dart';
import 'package:star_wars_front/presentation/components/score/score_post.dart';
import 'package:star_wars_front/presentation/components/sub_title/sub_title_post.dart';
import 'package:star_wars_front/presentation/components/title/title_post.dart';

class DetailNewsBody extends StatelessWidget {
  final News news;

  const DetailNewsBody({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlePost(title: news.title),
          const SizedBox(height: 8),
          SubTitlePost(subTitle: news.subTitle),
          const SizedBox(height: 8),
          DescriptionPost(description: news.description),
          const SizedBox(height: 8),
          const ScorePost(),
        ],
      ),
    );
  }
}
