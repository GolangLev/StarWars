import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/user.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_user_repository.dart';
import 'package:star_wars_front/general/urls.dart';

/// ## [UserRepository] class имплементирующий abstract class(interface) [IRepoUser]
class UserRepository implements IRepoUser {
  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();

  @override
  Future getUserById(int userId) {
    throw UnimplementedError();
  }

  @override
  Future signIn(String login, String password) {
    throw UnimplementedError();
  }

  @override
  Future signUp(User user) async {
    final url = Urls.signUp;
    try {
      final response = await Dio().post(url, data: jsonEncode(user.toJson()));
      if (response.statusCode == 200) {
        logger.i("Response SignUp: $response");
      }
    } catch (error) {
      logger.e("Repository SignUp: $error");
    }
  }
}
