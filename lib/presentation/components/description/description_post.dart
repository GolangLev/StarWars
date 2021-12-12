import 'package:flutter/material.dart';

class DescriptionPost extends StatelessWidget {
  final String description;

  const DescriptionPost({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.5,
      ),
      textAlign: TextAlign.start,
    );
  }
}
