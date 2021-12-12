import 'package:flutter/material.dart';

class ToggleDisLike extends StatelessWidget {
  final VoidCallback isDislike;
  final bool isChange;
  const ToggleDisLike({Key? key, required this.isDislike, required this.isChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isDislike();
      },
      child: Icon(
        Icons.thumb_down,
        color: !isChange ? Colors.grey : Colors.white,
      ),
    );
  }
}
