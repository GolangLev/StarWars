import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/films.dart';

import 'list_film_item/list_film_item.dart';

class ListFilmsItems extends StatelessWidget {
  final List<Film> film;

  const ListFilmsItems({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListFilmItem> listFilmItem = [];

    for (var value in film) {
      listFilmItem.add(ListFilmItem(
        film: value,
        margin: 5,
      ));
    }

    return Wrap(direction: Axis.horizontal,  children: [...listFilmItem]);
  }
}