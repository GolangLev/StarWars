import 'package:flutter/material.dart';
import 'package:star_wars_front/domain/models/fractions.dart';
import 'package:star_wars_front/presentation/components/constructor_button.dart';

class ListFractionItem extends StatefulWidget {
  final Fraction fraction;
  final double margin;
  bool isHover;

  ListFractionItem({Key? key, required this.fraction, required this.margin, this.isHover = false}) : super(key: key);

  @override
  _ListFractionItemState createState() => _ListFractionItemState();
}

class _ListFractionItemState extends State<ListFractionItem> {
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
        height: 225, //400
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
              height: 100,
              child: Image.asset(
                'assets/image/sw_logo.png',
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
            Text(
              widget.fraction.nameFraction,
              style: TextStyle(
                  color: widget.isHover ? const Color(0xFFE1AE39) : Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Expanded(child: Container()),
            ConstructorButton(
              isHover: widget.isHover,
              title: 'Перейти',
              navigationPath: '/detail_fraction',
              argument: widget.fraction,
            ),
          ],
        ),
      ),
    );
  }
}
