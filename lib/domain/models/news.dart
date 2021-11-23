import 'package:equatable/equatable.dart';

///[News] модель имитирующая структуру News, а также таблицу в базе данных News
class News extends Equatable {
  const News({
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

  ///[News.fromJSON(json)] фабричный конструктор.
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  factory News.fromJSON(Map json) {
    return News(
      id: json['id'] as int,
      title: json['title'],
      subTitle: json['sub_title'],
      description: json['description'],
    );
  }

  ///[News.copyWith(news)] фабричный конструктор.
  ///Для получение текущих данных в модели.
  factory News.copyWith(News news) {
    return News(
      id: news.id,
      title: news.title,
      subTitle: news.subTitle,
      description: news.description,
    );
  }

  ///[News.createEmpty()] фабричный конструктор.
  ///Имитирует пустую модель [News]
  factory News.createEmpty() {
    return const News(
      id: 0,
      title: "",
      subTitle: "",
      description: "",
    );
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
