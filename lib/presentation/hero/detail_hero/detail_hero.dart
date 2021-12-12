import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/detail_hero_bloc/detail_hero_cubit.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/presentation/components/detail_top_bar.dart';

import 'widgets/detail_hero_body.dart';

class DetailHero extends StatelessWidget {
  final Heroes heroes;

  const DetailHero({Key? key, required this.heroes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailHeroCubit, DetailHeroState>(
      builder: (context, state) {
        if (state is DetailStateNothing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailStateLoaded) {
          return Scaffold(
            body: Column(
              children: [
                DetailTopBar(title: state.responseHero.hero.displayTitle),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: DetailHeroBody(heroes: state.responseHero.hero),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
