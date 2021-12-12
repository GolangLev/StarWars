import 'package:flutter/material.dart';

class NavigationMenuItem extends StatelessWidget {
  final String nameItem;
  final Icon icon;
  final String navigationPath;

  const NavigationMenuItem(
      {Key? key,
      required this.nameItem,
      required this.icon,
      required this.navigationPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(navigationPath);
      },
      child: SizedBox(
        height: 88,
        width: double.infinity,
        child: ClipRRect(
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                const SizedBox(height: 6),
                Text(
                  nameItem,
                  style: const TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
