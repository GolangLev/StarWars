import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/films.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/description/description_post.dart';
import 'package:star_wars_front/presentation/components/score/score_post.dart';
import 'package:star_wars_front/presentation/components/sub_title/sub_title_post.dart';
import 'package:star_wars_front/presentation/components/title/title_post.dart';
import 'package:star_wars_front/presentation/components/years/years_post.dart';

class DetailFilmBody extends StatelessWidget {
  final Film film;

  const DetailFilmBody({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitlePost(title: film.title),
          const SizedBox(height: 8),
          SubTitlePost(subTitle: film.subTitle),
          const SizedBox(height: 8),
          DescriptionPost(description: film.description),
          const SizedBox(height: 8),
          YearsPost(years: film.years),
          const SizedBox(height: 8),
          const ScorePost(),
        ],
      ),
    );
  }
}
