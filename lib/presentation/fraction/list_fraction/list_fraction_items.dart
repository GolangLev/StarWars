import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/fractions.dart';

import 'list_fraction_item/list_fraction_item.dart';

class ListFractionItems extends StatelessWidget {
  final List<Fraction> fraction;
  const ListFractionItems({Key? key, required this.fraction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListFractionItem> listFractionItems = [];

    for (var value in fraction){
      listFractionItems.add(ListFractionItem(
        fraction: value,
        margin: 5,
      ));
    }

    return Wrap(direction: Axis.horizontal,  children: [...listFractionItems]);
  }
}
