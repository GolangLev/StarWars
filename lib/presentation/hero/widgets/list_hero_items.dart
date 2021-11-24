import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/heroes.dart';

import 'list_hero_item.dart';

class ListHeroItems extends StatelessWidget {
  final List<Heroes> hero;

  const ListHeroItems({required this.hero, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListHeroItem> listHeroItem = [];

    hero.forEach((Heroes value) {
      listHeroItem.add(ListHeroItem(hero: value));
    });

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [...listHeroItem],
      ),
    );
  }
}
