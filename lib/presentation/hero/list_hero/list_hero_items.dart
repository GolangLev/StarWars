import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/heroes.dart';

import 'list_hero_item/list_hero_item.dart';

class ListHeroItems extends StatelessWidget {
  final List<Heroes> hero;

  ListHeroItems({Key? key, required this.hero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListHeroItem> listHeroItem = [];

    for (var value in hero) {
      listHeroItem.add(ListHeroItem(
        hero: value,
        margin: 5,
      ));
    }

    return Wrap(direction: Axis.horizontal,  children: [...listHeroItem]);
  }
}
