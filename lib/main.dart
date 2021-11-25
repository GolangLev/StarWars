import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/hero_bloc.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/news_bloc.dart';
import 'package:star_wars_front/domain/repository/hero_repository.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';
import 'package:star_wars_front/theme.dart';

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
    final NewsRepository newsRepository = NewsRepository();
    final HeroRepository heroRepository = HeroRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              NewsBloc(newsRepository: newsRepository)..add(ListNewsStarted()),
          lazy: false,
        ),
        BlocProvider(
          create: (_) =>
              HeroBloc(heroRepository: heroRepository)..add(ListHeroStarted()),
          lazy: false,
        ),
      ],
      child: Container(),
    );
  }
}
