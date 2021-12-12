import 'package:flutter/material.dart';

class ToggleFavorite extends StatelessWidget {
  final VoidCallback isFavorite;
  final bool isChange;

  const ToggleFavorite({Key? key, required this.isFavorite, this.isChange = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isFavorite();
      },
      child: Icon(
        Icons.favorite,
        color: !isChange ? Colors.grey : Colors.red,
      )
    );
  }
}
