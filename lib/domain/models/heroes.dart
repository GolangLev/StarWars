import 'package:equatable/equatable.dart';

///[Hero] модель имитирующая структуру HeroJoin, а также таблицу в базе данных Heroes
class Hero extends Equatable {
  const Hero({
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

  ///[Hero.fromJSON(json)] фабричный конструктор.
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  factory Hero.fromJSON(Map json) {
    return Hero(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      nameFraction: json['name_fraction'],
    );
  }

  ///[Hero.copyWith(hero)] фабричный конструктор.
  ///Для получение текущих данных в модели.
  factory Hero.copyWith(Hero hero) {
    return Hero(
      id: hero.id,
      name: hero.name,
      description: hero.description,
      nameFraction: hero.nameFraction
    );
  }

  ///[Hero.createEmpty()] фабричный конструктор.
  ///Имитирует пустую модель [Hero]
  factory Hero.createEmpty() {
    return  const Hero(
      id: 0,
      name: "",
      description: "",
      nameFraction: "",
    );
  }
}
