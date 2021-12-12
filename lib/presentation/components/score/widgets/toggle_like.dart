import 'package:flutter/material.dart';

class ToggleLike extends StatelessWidget {
  final VoidCallback isLike;
  final bool isChange;
  const ToggleLike({Key? key, required this.isLike, required this.isChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isLike();
      },
      child: Icon(
        Icons.thumb_up,
        color: !isChange ? Colors.grey : Colors.green,
      ),
    );
  }
}
