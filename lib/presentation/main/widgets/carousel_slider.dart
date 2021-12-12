import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/image/slider_2.jpg',
      'assets/image/slider_3.jpg',
      'assets/image/slider_4.jpg',
    ];

    return SizedBox(
      width: 1024,
      height: 409,
      child: CarouselSlider.builder(
        itemCount: images.length,
        initialPage: 0,
        unlimitedMode: true,
        autoSliderTransitionTime: const Duration(seconds: 2),
        autoSliderDelay: const Duration(seconds: 3),
        enableAutoSlider: true,
        slideIndicator: CircularSlideIndicator(
            padding: const EdgeInsets.all(20),
            indicatorBorderColor: Colors.white,
            indicatorBackgroundColor: Colors.yellow),
        slideBuilder: (index) {
          return Image.asset(images[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
