import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_news_repository.dart';
import 'package:star_wars_front/general/urls.dart';

/// ## [NewsRepository] class имплементирующий abstract class(interface) [IRepoNews]
class NewsRepository implements IRepoNews {

  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();

  ///[getAllNews] получить список всех новостей
  @override
  Future getAllNews() async {
    final url = Urls.news;

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return ResponseNewsAll.fromJson(response.data);
      } else {
        logger.e("Repository GetAllNews, StatusCode != 200");
      }
    } catch (error) {
      logger.e("Repository GetAllNews: $error");
    }
  }

  ///[getNewsById] получить новость по id
  @override
  Future getNewsById(int id) async {
    final url = Urls.newsId + '$id';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        return ResponseNews.fromJson(response.data);
      } else {
        logger.e("Status code != 200: $response");
      }
    } catch (error) {
      logger.e("Error, GetNewsById: $error");
    }
  }
}
