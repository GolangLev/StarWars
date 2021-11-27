import 'package:equatable/equatable.dart';

///[Film] модель имитирующая структуру Film, а также таблицу в базе данных Films
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

  @override
  List<Object?> get props => [id, title, subTitle, description, years];

  ///[Film.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  Film.fromJSON(dynamic json)
      : id = json['id'],
        title = json['title'],
        subTitle = json['sub_title'],
        description = json['description'],
        years = json['years'];

  ///[toJSON]
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

class ResponseFilmsAll extends Equatable {
  final List<Film> film;

  ResponseFilmsAll.fromJson(dynamic json)
      : film = (json['Film'] as List).map((e) => Film.fromJSON(e)).toList();

  @override
  List<Object?> get props => [film];
}
