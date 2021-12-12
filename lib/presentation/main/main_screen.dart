import 'package:flutter/material.dart';
import 'widgets/carousel_slider.dart';
import 'widgets/info.dart';
import 'widgets/logo.dart';
import 'widgets/text_name.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 25),
            LogoWidget(),
            SizedBox(height: 30),
            TextNameWidget(),
            SizedBox(height: 15),
            InfoWidget(),
            SizedBox(height: 100),
            Center(child: CarouselSliderWidget(),)
          ],
        ),
      ),
    );
  }
}
