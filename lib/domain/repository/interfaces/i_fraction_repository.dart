import 'package:star_wars_front/domain/models/fractions.dart';

///[IRepoFraction] abstract class(interface) набор методов для работы с базой данных
abstract class IRepoFraction{
  Future getAllFractions();
  Future getFractionById(int id);
///Future createFraction(Fraction fraction);
///Future updateFraction(int id, Fraction fraction);
///Future deleteFraction(int id);
}