import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  _startTimer(){
    ///TODO изменить микросекунды на секунды, 1 на 5
    Timer(const Duration(microseconds: 1), (){
      Navigator.of(context).pushNamed('/user_action');
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 90),
            Container(
              width: 788,
              height: 382,
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                'assets/image/star_wars_logo_PNG13.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
            Expanded(child: Container()),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
            const SizedBox(height: 30),
            const Text(
              'Идёт подключение к галактической сети...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
