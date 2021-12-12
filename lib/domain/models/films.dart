import 'package:equatable/equatable.dart';

/// # [Film] class
///модель имитирующая структуру Film,
///а также таблицу в базе данных Films
/// * [id] - номер записи в таблице
/// * [title] - название фильма(заголовок)
/// * [subTitle] - краткое описание фильма
/// * [description] - полное описание фильма
/// * [years] - год выпуска
class Film extends Equatable {
  const Film._({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.years,
  });

  final int id;
  final String title;
  final String subTitle;
  final String description;
  final String years;

  Film copyWith(
      {int? id,
      String? title,
      String? subTitle,
      String? description,
      String? years}) {
    return Film._(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      description: description ?? this.description,
      years: years ?? this.years,
    );
  }

  String get displayTitle {
    if (title.isNotEmpty && subTitle.isNotEmpty) {
      return subTitle + ":" + title;
    } else {
      return id as String;
    }
  }

  @override
  List<Object?> get props => [id, title, subTitle, description, years];

  /// # [Film.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  Film.fromJSON(dynamic json)
      : id = json['id'],
        title = json['title'],
        subTitle = json['sub_title'],
        description = json['description'],
        years = json['years'];

  /// # [toJSON]
  ///Для отправки данных в формате JSON (POST, PUT, DELETE)
  Map<String, dynamic> toJSON() {
    var json = <String, dynamic>{};
    json['title'] = title;
    json['sub_title'] = subTitle;
    json['description'] = description;
    json['years'] = years;

    return json;
  }
}

/// # [ResponseFilmsAll] class
///для получения всех записей из таблицы [Film]
class ResponseFilmsAll extends Equatable {
  final List<Film> film;

  ResponseFilmsAll.fromJson(dynamic json)
      : film = (json['Film'] as List).map((e) => Film.fromJSON(e)).toList();

  @override
  List<Object?> get props => [film];
}

/// # [ResponseFilm] class
///для получения данных о конкретной записи из таблицы [Film]
class ResponseFilm extends Equatable {
  final Film film;

  const ResponseFilm({required this.film});

  ResponseFilm.fromJson(dynamic json) : film = Film.fromJSON(json['Film']);

  @override
  List<Object?> get props => [film];
}
