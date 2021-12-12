import 'package:flutter/material.dart';

class SubTitlePost extends StatelessWidget {
  final String subTitle;

  const SubTitlePost({Key? key, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
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
