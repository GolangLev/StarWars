import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/list_hero_bloc/hero_cubit.dart';
import 'package:star_wars_front/presentation/components/container.dart';
import 'package:star_wars_front/presentation/components/top_bar.dart';

import 'list_hero/list_hero_items.dart';

class HeroScreenPage extends StatelessWidget {
  const HeroScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroCubit, HeroState>(builder: (context, state) {
      if (state is HeroStateNothing) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      } else if (state is HeroStateLoaded) {
        return Scaffold(
          body: Column(
            children: [
              const TopBar(
                title: 'Персонажи',
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: ContentContainer(
                  child: ListHeroItems(
                    hero: state.hero.hero,
                  ),
                ),
              )),
            ],
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        );
      }
    });
  }
}
