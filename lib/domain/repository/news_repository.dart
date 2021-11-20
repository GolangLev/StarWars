import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_news_repository.dart';
import 'package:star_wars_front/general/urls.dart';
import 'package:http/http.dart' as http;

///[NewsRepository] class имплементирующий abstract class(interface) [IRepoNews]
class NewsRepository implements IRepoNews{

  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();

  ///[getAllNews] получить список всех новостей
  @override
  Future getAllNews() async {
    final url = Uri.http(Urls.news, '');

    try{
      final response = await http.get(url);

      if(response.statusCode == 200){
        logger.i("Info response news: $response");

        final jsonDecode = json.decode(response.body);

        return News.fromJSON(jsonDecode);
      }else{
        logger.e("Status code != 200: $response");
      }
    }catch(error){
      logger.e("Error, GET_ALL_NEWS: $error");
    }
  }


  ///[getNewsById] получить новость по id
  @override
  Future getNewsById(int id) async {
    final url = Uri.http(Urls.newsId, '$id');

    try{
      final response = await http.get(url);

      if(response.statusCode == 200){
        logger.i("Info response news: $response");

        final jsonDecode = json.decode(response.body);

        return News.fromJSON(jsonDecode);
      }else{
        logger.e("Status code != 200: $response");
      }
    }catch(error){
      logger.e("Error, GET_ALL_NEWS: $error");
    }
  }
}