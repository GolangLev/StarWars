import 'dart:async';
import 'package:flutter/material.dart';

class ErrorScreenPage extends StatefulWidget {
  const ErrorScreenPage({Key? key}) : super(key: key);

  @override
  _ErrorScreenPageState createState() => _ErrorScreenPageState();
}

class _ErrorScreenPageState extends State<ErrorScreenPage> {
  _startTimer(){
    Timer(const Duration(seconds: 5), (){
      Navigator.of(context).pushNamed('/home');
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
              'Произошла ошибка...',
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

