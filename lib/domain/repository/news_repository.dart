import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/network/network_news.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_news_repository.dart';
import 'package:star_wars_front/general/urls.dart';

///[NewsRepository] class имплементирующий abstract class(interface) [IRepoNews]
class NewsRepository implements IRepoNews {
  NewsRepository({required this.networkServiceNews});

  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();
  final NetworkServiceNews networkServiceNews;

  ///[getAllNews] получить список всех новостей
  Future<List<News>> getAllNews() async {
     final news = await networkServiceNews.getAllNews();
     return news!.map((e) => News.fromJSON(e)).toList();
  }


  ///[getNewsById] получить новость по id
  @override
  Future getNewsById(int id) async {
    final url = Urls.newsId + '$id';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        logger.i("Info response news: $response");

        final jsonDecode = json.decode(response.data);

        return News.fromJSON(jsonDecode);
      } else {
        logger.e("Status code != 200: $response");
      }
    } catch (error) {
      logger.e("Error, GET_ALL_NEWS: $error");
    }
  }
}