import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/games.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_game_repository.dart';
import 'package:star_wars_front/general/urls.dart';

/// ## [GameRepository] class имплементирующий abstract class(interface) [IRepoGame]
class GameRepository implements IRepoGame {

  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();

  @override
  Future getAllGames() async {
    final url = Urls.game;

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return ResponseGameAll.fromJson(response.data);
      } else {
        logger.e("Repository GetAllGames, StatusCode != 200");
      }
    } catch (error) {
      logger.e("Repository GetAllGames: $error");
    }
  }

  @override
  Future getGameById(int id) async {
    final url = Urls.gameId + '$id';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        return ResponseGame.fromJson(response.data);
      } else {
        logger.e("Status code != 200: $response");
      }
    } catch (error) {
      logger.e("Error, GetGameById: $error");
    }
  }
}