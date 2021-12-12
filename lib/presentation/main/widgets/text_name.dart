import 'package:flutter/material.dart';

class TextNameWidget extends StatelessWidget {
  const TextNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Добро пожаловать, ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
        SizedBox(width: 5),
        Text(
          'Магистр Йода',
          style: TextStyle(
            color: Color(0xFFE1AE39),
            fontSize: 48,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ],
    );
  }
}
