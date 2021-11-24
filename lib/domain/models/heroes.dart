import 'package:equatable/equatable.dart';

///[Hero] модель имитирующая структуру HeroJoin, а также таблицу в базе данных Heroes
class Heroes extends Equatable {
  const Heroes({
    required this.id,
    required this.name,
    required this.description,
    required this.nameFraction,
  });

  final int id;
  final String name;
  final String description;
  final String nameFraction;

  @override
  List<Object?> get props => [id, name, description, nameFraction];

  ///[Heroes.fromJSON(json)] фабричный конструктор.
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  factory Heroes.fromJSON(Map json) {
    return Heroes(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      nameFraction: json['name_fraction'],
    );
  }

  ///[Heroes.copyWith(hero)] фабричный конструктор.
  ///Для получение текущих данных в модели.
  factory Heroes.copyWith(Heroes hero) {
    return Heroes(
      id: hero.id,
      name: hero.name,
      description: hero.description,
      nameFraction: hero.nameFraction
    );
  }

  ///[Heroes.createEmpty()] фабричный конструктор.
  ///Имитирует пустую модель [Heroes]
  factory Heroes.createEmpty() {
    return  const Heroes(
      id: 0,
      name: "",
      description: "",
      nameFraction: "",
    );
  }
}

class ResponseHeroAll extends Equatable {
  final List<Heroes> hero;

  ResponseHeroAll.fromJson(dynamic json)
      : hero = (json['Hero'] as List).map((e) => Heroes.fromJSON(e)).toList();

  @override
  List<Object?> get props => [hero];
}
