import 'package:equatable/equatable.dart';

///[Fraction] модель имитирующая структуру Fraction, а также таблицу в базе данных Fractions
class Fraction extends Equatable {
  const Fraction({
    required this.id,
    required this.nameFraction,
  });

  final int id;
  final String nameFraction;

  @override
  List<Object?> get props => [id, nameFraction];

  ///[Fraction.fromJSON(json)] фабричный конструктор.
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  factory Fraction.fromJSON(Map json) {
    return Fraction(
      id: json['id'],
      nameFraction: json['name_fraction'],
    );
  }

  ///[Fraction.copyWith(fraction)] фабричный конструктор.
  ///Для получение текущих данных в модели.
  factory Fraction.copyWith(Fraction fraction) {
    return Fraction(
      id: fraction.id,
      nameFraction: fraction.nameFraction,
    );
  }

  ///[Fraction.createEmpty()] фабричный конструктор.
  ///Имитирует пустую модель [Fraction]
  factory Fraction.createEmpty() {
    return const Fraction(
      id: 0,
      nameFraction: "",
    );
  }
}

class ResponseFractionAll extends Equatable {
  final List<Fraction> fraction;

  ResponseFractionAll.fromJson(dynamic json)
      : fraction = (json['Fraction'] as List).map((e) => Fraction.fromJSON(e)).toList();

  @override
  List<Object?> get props => [fraction];
}
