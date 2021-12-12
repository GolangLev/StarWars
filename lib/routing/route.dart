import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_front/domain/bloc/auth_bloc/registration/registration_cubit.dart';
import 'package:star_wars_front/domain/bloc/decoration_bloc/decoration_bloc_cubit.dart';
import 'package:star_wars_front/domain/bloc/film_bloc/detail_film_bloc/detail_film_cubit.dart';
import 'package:star_wars_front/domain/bloc/film_bloc/list_film_bloc/film_cubit.dart';
import 'package:star_wars_front/domain/bloc/fraction_bloc/detail_fraction_bloc/detail_fraction_cubit.dart';
import 'package:star_wars_front/domain/bloc/fraction_bloc/list_fraction_bloc/fraction_cubit.dart';
import 'package:star_wars_front/domain/bloc/game_bloc/detail_game_bloc/detail_game_cubit.dart';
import 'package:star_wars_front/domain/bloc/game_bloc/list_game_bloc/game_cubit.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/detail_hero_bloc/detail_hero_cubit.dart';
import 'package:star_wars_front/domain/bloc/hero_bloc/list_hero_bloc/hero_cubit.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/detail_news_bloc/detail_news_cubit.dart';
import 'package:star_wars_front/domain/bloc/news_bloc/list_news_bloc/news_cubit.dart';
import 'package:star_wars_front/domain/models/films.dart';
import 'package:star_wars_front/domain/models/fractions.dart';
import 'package:star_wars_front/domain/models/games.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/film_repository.dart';
import 'package:star_wars_front/domain/repository/fraction_repository.dart';
import 'package:star_wars_front/domain/repository/game_repository.dart';
import 'package:star_wars_front/domain/repository/hero_repository.dart';
import 'package:star_wars_front/domain/repository/news_repository.dart';
import 'package:star_wars_front/domain/repository/user_repository.dart';
import 'package:star_wars_front/presentation/error/error_screen.dart';
import 'package:star_wars_front/presentation/film/detail_film/detail_film.dart';
import 'package:star_wars_front/presentation/film/film_screen.dart';
import 'package:star_wars_front/presentation/fraction/detail_fraction/detail_fraction.dart';
import 'package:star_wars_front/presentation/fraction/fraction_screen.dart';
import 'package:star_wars_front/presentation/game/detail_game/detail_game.dart';
import 'package:star_wars_front/presentation/game/game_screen.dart';
import 'package:star_wars_front/presentation/hero/detail_hero/detail_hero.dart';
import 'package:star_wars_front/presentation/hero/hero_screen.dart';
import 'package:star_wars_front/presentation/home/home_screen.dart';
import 'package:star_wars_front/presentation/main_action/main_action_screen.dart';
import 'package:star_wars_front/presentation/news/detail_news/detail_news.dart';
import 'package:star_wars_front/presentation/news/news_screen.dart';
import 'package:star_wars_front/presentation/profile/profile_screen.dart';
import 'package:star_wars_front/presentation/splash/splash_screen.dart';

class AppGenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    NewsRepository newsRepository = NewsRepository();
    HeroRepository heroRepository = HeroRepository();
    GameRepository gameRepository = GameRepository();
    FractionRepository fractionRepository = FractionRepository();
    FilmRepository filmRepository = FilmRepository();
    UserRepository userRepository = UserRepository();
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return _getPageRote(const SplashScreenPage());
      case '/user_action':
        return _getPageRote(BlocProvider(
            create: (_) => RegistrationCubit(userRepository: userRepository),
            child: const MainActionScreenPage()));
      case '/home':
        return _getPageRote(const HomeScreenPage());
      case '/news':
        return _getPageRote(BlocProvider(
            create: (_) =>
                NewsCubit(newsRepository: newsRepository)..getAllNews(),
            child: const NewsScreenPage()));
      case '/film':
        return _getPageRote(BlocProvider(
            create: (_) =>
                FilmCubit(filmRepository: filmRepository)..getAllFilms(),
            child: const FilmScreenPage()));
      case '/hero':
        return _getPageRote(BlocProvider(
            create: (_) =>
                HeroCubit(heroRepository: heroRepository)..getAllHeroes(),
            child: const HeroScreenPage()));
      case '/fraction':
        return _getPageRote(BlocProvider(
            create: (_) => FractionCubit(fractionRepository: fractionRepository)
              ..getAllFractions(),
            child: const FractionScreenPage()));
      case '/game':
        return _getPageRote(BlocProvider(
            create: (_) =>
                GameCubit(gameRepository: gameRepository)..getAllGames(),
            child: const GameScreenPage()));
      case '/profile':
        return _getPageRote(const ProfileScreenPage());
      case '/detail_news':
        if (args is News) {
          return _getPageRote(
            BlocProvider(
              create: (_) => DetailNewsCubit(newsRepository: newsRepository)
                ..getNewsById(args.id),
              lazy: false,
              child: DetailNews(news: args),
            ),
          );
        } else {
          return _errorScreen();
        }
      case '/detail_film':
        if (args is Film) {
          return _getPageRote(BlocProvider(
            create: (_) => DetailFilmCubit(filmRepository: filmRepository)
              ..getFilmById(args.id),
            lazy: false,
            child: DetailFilm(
              film: args,
            ),
          ));
        } else {
          return _errorScreen();
        }
      case '/detail_fraction':
        if (args is Fraction) {
          return _getPageRote(
            BlocProvider(
              create: (_) =>
                  DetailFractionCubit(fractionRepository: fractionRepository)
                    ..getFractionById(args.id),
              lazy: false,
              child: DetailFraction(
                fraction: args,
              ),
            ),
          );
        } else {
          return _errorScreen();
        }
      case '/detail_game':
        if (args is Game) {
          return _getPageRote(
            BlocProvider(
              create: (_) => DetailGameCubit(gameRepository: gameRepository)
                ..getGameById(args.id),
              lazy: false,
              child: DetailGame(
                game: args,
              ),
            ),
          );
        } else {
          return _errorScreen();
        }
      case '/detail_hero':
        if (args is Heroes) {
          return _getPageRote(
            BlocProvider(
              create: (_) => DetailHeroCubit(heroRepository: heroRepository)
                ..getHeroById(args.id),
              lazy: false,
              child: DetailHero(
                heroes: args,
              ),
            ),
          );
        } else {
          return _errorScreen();
        }
      default:
        return _errorScreen();
    }
  }

  static Route<dynamic>? _errorScreen() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: ErrorScreenPage(),
      );
    });
  }
}

PageRoute _getPageRote(Widget child) {
  return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (_) => DecorationCubit(),
              lazy: false,
            ),
          ], child: child));
}
