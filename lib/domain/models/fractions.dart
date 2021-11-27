import 'package:equatable/equatable.dart';

///[Fraction] модель имитирующая структуру Fraction, а также таблицу в базе данных Fractions
class Fraction extends Equatable {
  const Fraction._({
    required this.id,
    required this.nameFraction,
  });

  final int id;
  final String nameFraction;

  Fraction copyWith({
    int? id,
    String? nameFraction,
  }) {
    return Fraction._(
        id: id ?? this.id, nameFraction: nameFraction ?? this.nameFraction);
  }

  @override
  List<Object?> get props => [id, nameFraction];

  ///[Fraction.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  Fraction.fromJSON(dynamic json)
      : id = json['id'],
        nameFraction = json['name_fraction'];

  ///[toJSON]
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJSON() {
    var json = <String, dynamic>{};

    json['name_fraction'] = nameFraction;

    return json;
  }
}

class ResponseFractionAll extends Equatable {
  final List<Fraction> fraction;

  ResponseFractionAll.fromJson(dynamic json)
      : fraction = (json['Fraction'] as List)
            .map((e) => Fraction.fromJSON(e))
            .toList();

  @override
  List<Object?> get props => [fraction];
}
