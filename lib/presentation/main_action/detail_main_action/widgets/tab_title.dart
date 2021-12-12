import 'package:flutter/material.dart';

class TabBarTitle extends StatelessWidget {
  final String title;

  const TabBarTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Color(0xFFDFE3E7),
        )),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
