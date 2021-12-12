import 'package:equatable/equatable.dart';

/// # [Fraction] class
///модель имитирующая структуру Fraction,
///а также таблицу в базе данных Fractions
/// * [id] - номер записи в таблице
/// * [nameFraction] - название фракции
/// * [description] - описание фракции
class Fraction extends Equatable {
  const Fraction._(
      {required this.id,
      required this.nameFraction,
      required this.description});

  final int id;
  final String nameFraction;
  final String description;

  Fraction copyWith({
    int? id,
    String? nameFraction,
    String? description,
  }) {
    return Fraction._(
        id: id ?? this.id,
        nameFraction: nameFraction ?? this.nameFraction,
        description: description ?? this.description);
  }

  String get displayTitle {
    if (nameFraction.isNotEmpty) {
      return nameFraction;
    } else {
      return id as String;
    }
  }

  @override
  List<Object?> get props => [id, nameFraction, description];

  /// # [Fraction.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  Fraction.fromJSON(dynamic json)
      : id = json['id'],
        nameFraction = json['name_fraction'],
        description = json['description'];

  /// # [toJSON]
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJSON() {
    var json = <String, dynamic>{};

    json['name_fraction'] = nameFraction;
    json['description'] = description;

    return json;
  }
}

/// # [ResponseFractionAll] class
///для получения всех записей из таблицы [Fraction]
class ResponseFractionAll extends Equatable {
  final List<Fraction> fraction;

  ResponseFractionAll.fromJson(dynamic json)
      : fraction = (json['Fraction'] as List)
            .map((e) => Fraction.fromJSON(e))
            .toList();

  @override
  List<Object?> get props => [fraction];
}

/// # [ResponseFraction] class
///для получения конкретной записи из таблицы [Fraction]
class ResponseFraction extends Equatable {
  final Fraction fraction;

  const ResponseFraction({required this.fraction});

  ResponseFraction.fromJson(dynamic json)
      : fraction = Fraction.fromJSON(json['Fraction']);

  @override
  List<Object?> get props => [fraction];
}
