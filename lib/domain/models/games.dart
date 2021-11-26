import 'package:equatable/equatable.dart';

///[Game] модель имитирующая структуру Game, а также таблицу в базе данных Games
class Game extends Equatable {
  const Game({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
  });

  final int id;
  final String title;
  final String subTitle;
  final String description;

  @override
  List<Object?> get props => [id, title, subTitle, description];

  ///[Game.fromJSON(json)] фабричный конструктор.
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  factory Game.fromJSON(Map json) {
    return Game(
      id: json['id'],
      title: json['title'],
      subTitle: json['sub_title'],
      description: json['description'],
    );
  }

  ///[Game.copyWith(game)] фабричный конструктор.
  ///Для получение текущих данных в модели.
  factory Game.copyWith(Game game) {
    return Game(
      id: game.id,
      title: game.title,
      subTitle: game.subTitle,
      description: game.description,
    );
  }

  ///[Game.createEmpty()] фабричный конструктор.
  ///Имитирует пустую модель [Game]
  factory Game.createEmpty() {
    return const Game(
      id: 0,
      title: "",
      subTitle: "",
      description: "",
    );
  }
}

class ResponseGameAll extends Equatable {
  final List<Game> game;

  ResponseGameAll.fromJson(dynamic json)
      : game = (json['Game'] as List).map((e) => Game.fromJSON(e)).toList();

  @override
  List<Object?> get props => [game];
}
