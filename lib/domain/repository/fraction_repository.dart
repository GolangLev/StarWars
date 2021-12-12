import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:star_wars_front/domain/models/fractions.dart';
import 'package:star_wars_front/domain/repository/interfaces/i_fraction_repository.dart';
import 'package:star_wars_front/general/urls.dart';

/// ## [FractionRepository] class имплементирующий abstract class(interface) [IRepoFraction]
class FractionRepository implements IRepoFraction {

  ///[logger] вывод логов в консоль для отладки
  final logger = Logger();

  @override
  Future getAllFractions() async {
    final url = Urls.fraction;

    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return ResponseFractionAll.fromJson(response.data);
      } else {
        logger.e("Repository GetAllFractions, StatusCode != 200");
      }
    } catch (error) {
      logger.e("Repository GetAllFractions: $error");
    }
  }

  @override
  Future getFractionById(int id) async {
    final url = Urls.fractionId + '$id';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        return ResponseFraction.fromJson(response.data);
      } else {
        logger.e("Status code != 200: $response");
      }
    } catch (error) {
      logger.e("Error, GetFractionById: $error");
    }
  }
}