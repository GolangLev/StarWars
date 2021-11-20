import 'package:equatable/equatable.dart';

///[Film] модель имитирующая структуру Film, а также таблицу в базе данных Films
class Film extends Equatable {
  const Film({
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

  @override
  List<Object?> get props => [id, title, subTitle, description, years];

  ///[Film.fromJSON(json)] фабричный конструктор.
  ///Для возвращения данных из модели.
  ///Получение данных отправленных API в формате JSON.
  factory Film.fromJSON(Map json) {
    return Film(
      id: json['id'],
      title: json['title'],
      subTitle: json['sub_title'],
      description: json['description'],
      years: json['years'],
    );
  }

  ///[Film.copyWith(film)] фабричный конструктор.
  ///Для получение текущих данных в модели.
  factory Film.copyWith(Film film) {
    return Film(
      id: film.id,
      title: film.title,
      subTitle: film.subTitle,
      description: film.description,
      years: film.years,
    );
  }

  ///[Film.createEmpty()] фабричный конструктор.
  ///Имитирует пустую модель [Film]
  factory Film.createEmpty() {
    return const Film(
      id: 0,
      title: "",
      subTitle: "",
      description: "",
      years: "",
    );
  }
}
