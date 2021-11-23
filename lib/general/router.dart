import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/news/news_cubit.dart';
import 'package:star_wars_front/domain/network/network_news.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';
import 'package:star_wars_front/presentation/screen/hero_screen.dart';
import 'package:star_wars_front/presentation/screen/news_screen.dart';

import 'constants.dart';

class AppRouter {

  late NewsRepository repository;

  AppRouter(){
    repository = NewsRepository(networkServiceNews: NetworkServiceNews());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.newsScreen:
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              lazy: false,
              create: (context) =>  NewsCubit(repository: repository),
              child: NewsScreen(),
            ));
      case Constants.heroScreen:
        return MaterialPageRoute(builder: (_) => HeroScreen());
      default:
        return null;
    }
  }

}