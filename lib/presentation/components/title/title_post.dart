import 'package:flutter/material.dart';

class TitlePost extends StatelessWidget {
  final String title;

  const TitlePost({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
    );
  }
}
