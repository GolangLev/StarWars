import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/hero_bloc.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/news_bloc.dart';
import 'package:star_wars_front/domain/repository/hero_repository.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';
import 'package:star_wars_front/presentation/column_widget/column_widget.dart';
import 'package:star_wars_front/presentation/home/screen_info/screen_info.dart';
import 'package:star_wars_front/presentation/home/side_menu/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsRepository newsRepository = NewsRepository();
    HeroRepository heroRepository = HeroRepository();

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
      child: Row(
        children: const [
          Expanded(flex: 3, child: SideMenu()),
          Expanded(
            flex: 4,
            child: ColumnWidgets(),
          ),
          Expanded(flex: 8, child: ScreenInfo()),
        ],
      ),
    );
  }
}
