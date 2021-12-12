import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/heroes.dart';
import 'package:star_wars_front/presentation/components/constructor_button.dart';

class ListHeroItem extends StatefulWidget {
  final Heroes hero;
  final double margin;
  bool isHover;

  ListHeroItem(
      {Key? key,
      required this.hero,
      required this.margin,
      this.isHover = false})
      : super(key: key);

  @override
  _ListHeroItemState createState() => _ListHeroItemState();
}

class _ListHeroItemState extends State<ListHeroItem> {
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
        width: 300,
        height: 400,
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
              widget.hero.name,
              style: TextStyle(
                  color:
                      widget.isHover ? const Color(0xFFE1AE39) : Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              widget.hero.nameFraction,
              style: TextStyle(
                  color:
                      widget.isHover ? const Color(0xFFE1AE39) : Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            ConstructorButton(
              isHover: widget.isHover,
              title: 'Перейти',
              navigationPath: '/detail_hero',
              argument: widget.hero,
            ),
          ],
        ),
      ),
    );
  }
}
