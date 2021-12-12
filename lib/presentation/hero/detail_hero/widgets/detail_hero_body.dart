import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/description/description_post.dart';
import 'package:star_wars_front/presentation/components/score/score_post.dart';
import 'package:star_wars_front/presentation/components/sub_title/sub_title_post.dart';
import 'package:star_wars_front/presentation/components/title/title_post.dart';

class DetailHeroBody extends StatelessWidget {
  final Heroes heroes;

  const DetailHeroBody({Key? key, required this.heroes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlePost(title: heroes.name),
          const SizedBox(height: 8),
          SubTitlePost(subTitle: heroes.nameFraction),
          const SizedBox(height: 8),
          DescriptionPost(description: heroes.description),
          const SizedBox(height: 8),
          const ScorePost(),
        ],
      ),
    );
  }
}
