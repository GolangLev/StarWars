import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/films.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_film_repository.dart';
import 'package:star_wars_front/general/urls.dart';

///[FilmRepository] class имплементирующий abstract class(interface) [IRepoFilm]
class FilmRepository implements IRepoFilm {

  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();

  @override
  Future getAllFilms() async {
    final url = Urls.film;

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        logger.i("Repository GetAllFilms Response: $response");
        return ResponseFilmsAll.fromJson(response.data);
      } else {
        logger.e("Repository GetAllFilms, StatusCode != 200");
      }
    } catch (error) {
      logger.e("Repository GetAllFilms: $error");
    }
  }

  @override
  Future getFilmById(int id) async {
    final url = Urls.filmId + '$id';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        logger.i("Repository GetFilmById Response: $response");

        return Film.fromJSON(response.data);
      } else {
        logger.e("Status code != 200: $response");
      }
    } catch (error) {
      logger.e("Error, GetFilmById: $error");
    }
  }
}