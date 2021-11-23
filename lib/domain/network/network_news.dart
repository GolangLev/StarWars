import 'dart:math';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/general/urls.dart';

class NetworkServiceNews{

  final logger = Logger();

  Future<List<dynamic>?> getAllNews() async {
    final url = Urls.news;
    logger.i(url);
    try{
      final response =  await Dio().get(url);
      logger.i("Network response: ${response.data}");
      response.data as List;
    }catch(e){
      logger.e("Network error: $e");
      return [];
    }
  }

}