import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/fractions.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/description/description_post.dart';
import 'package:star_wars_front/presentation/components/score/score_post.dart';
import 'package:star_wars_front/presentation/components/title/title_post.dart';

class DetailFractionBody extends StatelessWidget {
  final Fraction fraction;

  const DetailFractionBody({Key? key, required this.fraction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlePost(title: fraction.nameFraction),
          const SizedBox(height: 8),
          DescriptionPost(description: fraction.description),
          const SizedBox(height: 8),
          const ScorePost(),
        ],
      ),
    );
  }
}
