import 'dart:math';

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

  @override
  Future deleteNews(int id) async {
    final url = Urls.deleteNews + '$id';

    try {
      await Dio().delete(url,
          data: ({
            'id': id,
          }));
    } catch (error) {
      logger.e("Repository DeleteNews: $error");
    }
  }

  @override
  Future createNews(News news) async {
    final url = Urls.createNews;

    try {
      final response = await Dio().post(url, data: news.toJSON());
      if(response.statusCode == 200){
        logger.i("Try. CreateNews: Данные отправлены");
      }else{
        logger.e("Try. CreateNews error");
      }
    } catch (error) {
      logger.e("Catch. Repository CreateNews");
    }
  }

  @override
  Future updateNews(int id, News news) async {
    final url = Urls.updateNews + '$id';

    try{
      final response = await Dio().put(url, data: news.toJSON());
      if(response.statusCode == 200){
        logger.i("Try. Update news. Good");
      }
    }catch(error){
      logger.e("Catch. UpdateNews: $error");
    }
  }
}
