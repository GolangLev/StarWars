import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/news.dart';
import 'package:star_wars_front/presentation/components/constructor_button.dart';

class ListNewsItem extends StatefulWidget {
  final News news;
  final double margin;
  bool isHover;

  ListNewsItem({Key? key, required this.news, required this.margin, this.isHover = false})
      : super(key: key);

  @override
  _ListNewsItemState createState() => _ListNewsItemState();
}

class _ListNewsItemState extends State<ListNewsItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      onHover: (hover) {
        setState(() => widget.isHover = hover);
      },
      child: AnimatedContainer(
        width: 300, //300
        height: 450, //400
        margin: EdgeInsets.all(widget.margin),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 270,
              height: 120,
              child: Image.asset(
                'assets/image/sw_logo.png',
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
            Text(
              widget.news.title,
              style: TextStyle(
                  color: widget.isHover ? const Color(0xFFE1AE39) : Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              widget.news.subTitle,
              style: TextStyle(
                  color: widget.isHover ? const Color(0xFFE1AE39) : Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            ConstructorButton(
              isHover: widget.isHover,
              title: 'Перейти',
              navigationPath: '/detail_news',
              argument: widget.news,
            ),
          ],
        ),
      ),
    );
  }
}
