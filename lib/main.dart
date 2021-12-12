import 'package:flutter/material.dart';
import 'package:star_wars_front/routing/route.dart';
import 'package:star_wars_front/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      title: "Звездные войны",
      initialRoute: '/',
      onGenerateRoute: AppGenerateRoute.onGenerateRoute,
    );
  }
}
