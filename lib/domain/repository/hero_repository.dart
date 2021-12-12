import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_hero_repository.dart';
import 'package:star_wars_front/general/urls.dart';

/// ## [HeroRepository] class имплементирующий abstract class(interface) [IRepoHero]
class HeroRepository implements IRepoHero {

  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();

  @override
  Future getAllHeroes() async {
    final url = Urls.hero;

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return ResponseHeroAll.fromJson(response.data);
      } else {
        logger.e("Repository GetAllHeroes, StatusCode != 200");
      }
    } catch (error) {
      logger.e("Repository GetAllHeroes: $error");
    }
  }

  @override
  Future getHeroById(int id) async {
    final url = Urls.heroId + '$id';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        return ResponseHero.fromJson(response.data);
      } else {
        logger.e("Status code != 200: $response");
      }
    } catch (error) {
      logger.e("Error, GetHeroById: $error");
    }
  }
}
