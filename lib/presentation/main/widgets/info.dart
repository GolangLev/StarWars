import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '''Галактическая сеть даст неограниченный объём знаний о вселенной, а также ты можешь обсудить\nс другими магистрами очень интересные темы''',
      style: TextStyle(
        color: Color(0xFFE1AE39),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
    );
  }
}
