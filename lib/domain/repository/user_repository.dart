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
  Future getUserById(int userId) async {
    final url = Urls.userId + '$userId';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        logger.i("Repository GetUserById User.fromJson(response.data): ${User.fromJson(response.data)}");
        return ResponseUser.fromJson(response.data);
      } else {
        logger.e("Repository GetUserById: StatusCode != 200");
      }
    } catch (error) {
      logger.e("Repository GetUserById: $error");
    }
  }

  @override
  Future signIn(SignInInput signInInput) async {
    final url = Urls.signIn;

    try {
      final response =
          await Dio().post(url, data: jsonEncode(signInInput.toJson()));

      if (response.statusCode == 200) {
        logger.i(
            "ResponseAuthUser.fromJson(response.data) ${ResponseAuthUser.fromJson(response.data)}");
        return ResponseAuthUser.fromJson(response.data);
      }
    } catch (error) {
      logger.e("Repository SignIn: $error");
    }
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
