import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/games.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/description/description_post.dart';
import 'package:star_wars_front/presentation/components/score/score_post.dart';
import 'package:star_wars_front/presentation/components/sub_title/sub_title_post.dart';
import 'package:star_wars_front/presentation/components/title/title_post.dart';

class DetailGameBody extends StatelessWidget {
  final Game game;

  const DetailGameBody({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlePost(title: game.title),
          const SizedBox(height: 8),
          SubTitlePost(subTitle: game.subTitle),
          const SizedBox(height: 8),
          DescriptionPost(description: game.description),
          const SizedBox(height: 8),
          const ScorePost(),
        ],
      ),
    );
  }
}
