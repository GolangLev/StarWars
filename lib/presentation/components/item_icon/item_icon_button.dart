import 'package:flutter/material.dart';

class IconItemButton extends StatelessWidget {
  final Icon icon;
  final String navigationPath;
  const IconItemButton({Key? key, required this.icon, required this.navigationPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pushNamed(navigationPath);
      },
      padding: const EdgeInsets.all(0),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      icon: icon,
    );
  }
}

