import 'package:flutter/material.dart';

class ConstructorButton extends StatelessWidget {
  final String title;
  final bool isHover;
  ///TODO Убрать указание необязательного параметра
  final String? navigationPath;
  final Object? argument;
  const ConstructorButton({Key? key, required this.isHover, required this.title, this.navigationPath, this.argument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(navigationPath!, arguments: argument);
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        width: isHover ? 165 : 170,
        height: isHover ? 43 : 48,
        decoration: BoxDecoration(
          color: !isHover ? Colors.white : const Color(0xFFE1AE39),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: !isHover ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


