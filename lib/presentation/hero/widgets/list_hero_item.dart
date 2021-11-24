import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/heroes.dart';

class ListHeroItem extends StatelessWidget {
  final Heroes hero;

  const ListHeroItem({required this.hero, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black45,
        ),
        height: 56,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${hero.name}', style: TextStyle(color: Colors.white)),
            Text('SubTitle: ${hero.nameFraction}', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
