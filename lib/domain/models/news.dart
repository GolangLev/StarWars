import 'package:equatable/equatable.dart';

///[News] модель имитирующая структуру News, а также таблицу в базе данных News
class News extends Equatable {
  const News._({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
  });

  final int id;
  final String title;
  final String subTitle;
  final String description;

  News copyWith({
    int? id,
    String? title,
    String? subTitle,
    String? description,
  }) {
    return News._(
        id: id ?? this.id,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        description: description ?? this.description);
  }

  @override
  List<Object?> get props => [id, title, subTitle, description];

  ///[News.fromJSON(json)]
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  News.fromJSON(Map json)
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

class ResponseNews extends Equatable {
  final News news;

  const ResponseNews({required this.news});

  ResponseNews.fromJson(dynamic json) : news = News.fromJSON(json['Data']);

  @override
  List<Object?> get props => [news];
}

class ResponseNewsAll extends Equatable {
  final List<News> news;

  ResponseNewsAll.fromJson(dynamic json)
      : news = (json['Data'] as List).map((e) => News.fromJSON(e)).toList();

  @override
  List<Object?> get props => [news];
}
