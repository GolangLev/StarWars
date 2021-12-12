import 'package:flutter/material.dart';

class YearsPost extends StatelessWidget {
  final String years;
  const YearsPost({Key? key, required this.years}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      years,
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
