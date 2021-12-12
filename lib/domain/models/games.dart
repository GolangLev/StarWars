import 'package:equatable/equatable.dart';

/// # [Game] class
///модель имитирующая структуру Game,
///а также таблицу в базе данных Games
/// * [id] - номер записи в таблице
/// * [title] - название игры(заголовок)
/// * [subTitle] - краткое описание
/// * [description] - полное описание
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

  String get displayTitle {
    if (title.isNotEmpty && subTitle.isNotEmpty) {
      return subTitle + ":" + title;
    } else {
      return id as String;
    }
  }

  @override
  List<Object?> get props => [id, title, subTitle, description];

  /// # [Game.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  Game.fromJSON(dynamic json)
      : id = json['id'],
        title = json['title'],
        subTitle = json['sub_title'],
        description = json['description'];

  /// # [toJSON]
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJSON() {
    var json = <String, dynamic>{};

    json['title'] = title;
    json['sub_title'] = subTitle;
    json['description'] = description;

    return json;
  }
}

/// # [ResponseGameAll] class
/// для получения всех записей из таблицы [Game]
class ResponseGameAll extends Equatable {
  final List<Game> game;

  ResponseGameAll.fromJson(dynamic json)
      : game = (json['Game'] as List).map((e) => Game.fromJSON(e)).toList();

  @override
  List<Object?> get props => [game];
}

/// # [ResponseGame] class
/// для получения конкретной записи из таблицы [Game]
class ResponseGame extends Equatable {
  final Game game;

  const ResponseGame({required this.game});

  ResponseGame.fromJson(dynamic json) : game = Game.fromJSON(json['Game']);

  @override
  List<Object?> get props => [game];
}
