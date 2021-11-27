import 'package:equatable/equatable.dart';

///[Game] модель имитирующая структуру Game, а также таблицу в базе данных Games
class Game extends Equatable {
  const Game._({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
  });

  final int id;
  final String title;
  final String subTitle;
  final String description;

  Game copyWith({
    int? id,
    String? title,
    String? subTitle,
    String? description,
  }) {
    return Game._(
        id: id ?? this.id,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        description: description ?? this.description);
  }

  @override
  List<Object?> get props => [id, title, subTitle, description];

  ///[Game.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  Game.fromJSON(dynamic json)
      : id = json['id'],
        title = json['title'],
        subTitle = json['sub_title'],
        description = json['description'];

  ///[toJSON]
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJSON() {
    var json = <String, dynamic>{};

    json['title'] = title;
    json['sub_title'] = subTitle;
    json['description'] = description;

    return json;
  }
}

class ResponseGameAll extends Equatable {
  final List<Game> game;

  ResponseGameAll.fromJson(dynamic json)
      : game = (json['Game'] as List).map((e) => Game.fromJSON(e)).toList();

  @override
  List<Object?> get props => [game];
}
