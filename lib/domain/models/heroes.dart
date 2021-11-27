import 'package:equatable/equatable.dart';

///[Hero] модель имитирующая структуру HeroJoin, а также таблицу в базе данных Heroes
class Heroes extends Equatable {
  const Heroes._({
    required this.id,
    required this.name,
    required this.description,
    required this.nameFraction,
  });

  final int id;
  final String name;
  final String description;
  final String nameFraction;

  Heroes copyWith({
    int? id,
    String? name,
    String? description,
    String? nameFraction,
  }) {
    return Heroes._(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        nameFraction: nameFraction ?? this.description);
  }

  @override
  List<Object?> get props => [id, name, description, nameFraction];

  ///[Heroes.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  Heroes.fromJSON(dynamic json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        nameFraction = json['name_fraction'];

  ///[toJson]
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    json['name'] = name;
    json['description'] = description;
    json['name_fraction'] = nameFraction;

    return json;
  }
}

class ResponseHeroAll extends Equatable {
  final List<Heroes> hero;

  ResponseHeroAll.fromJson(dynamic json)
      : hero = (json['Hero'] as List).map((e) => Heroes.fromJSON(e)).toList();

  @override
  List<Object?> get props => [hero];
}
