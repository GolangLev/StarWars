import 'package:flutter/material.dart';
import 'package:star_wars_front/presentation/main/main_screen.dart';
import 'package:star_wars_front/presentation/navigation/navigation_bar.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: const [
            Expanded(child: NavigationBar()),
            SizedBox(width: 10),
            Expanded(flex: 10, child: MainScreenPage())
          ],
        ),
      ),
    );
  }
}
