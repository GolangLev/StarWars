import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/games.dart';

import 'list_game_item/list_game_item.dart';

class ListGamesItems extends StatelessWidget {
  final List<Game> game;

  const ListGamesItems({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListGameItem> listGameItem = [];

    for (var value in game) {
      listGameItem.add(ListGameItem(
        game: value,
        margin: 5,
      ));
    }

    return Wrap(direction: Axis.horizontal,  children: [...listGameItem]);
  }
}