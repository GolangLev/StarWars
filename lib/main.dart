import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/film_bloc/film_cubit.dart';
import 'package:star_wars_front/domain/bloc/fraction_bloc/fraction_cubit.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/hero_cubit.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/news_cubit.dart';
import 'package:star_wars_front/domain/repository/film_repository.dart';
import 'package:star_wars_front/domain/repository/fraction_repository.dart';
import 'package:star_wars_front/domain/repository/game_repository.dart';
import 'package:star_wars_front/domain/repository/hero_repository.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';
import 'package:star_wars_front/theme.dart';

import 'domain/bloc/game_bloc/game_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      title: "StarWars",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsRepository newsRepository = NewsRepository();
    HeroRepository heroRepository = HeroRepository();
    GameRepository gameRepository = GameRepository();
    FractionRepository fractionRepository = FractionRepository();
    FilmRepository filmRepository = FilmRepository();


    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => NewsCubit(newsRepository: newsRepository)..getAllNews(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => HeroCubit(heroRepository: heroRepository)..getAllHeroes(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => GameCubit(gameRepository: gameRepository)..getAllGames(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => FractionCubit(fractionRepository: fractionRepository)..getAllFractions(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => FilmCubit(filmRepository: filmRepository)..getAllFilms(),
        lazy: false,
      ),
    ], child: Container());
  }
}
