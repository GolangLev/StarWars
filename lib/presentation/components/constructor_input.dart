import 'package:flutter/material.dart';

class ConstructorInput extends StatelessWidget {
  final String label;
  final String message;
  final TextEditingController? controller;
  final Color? color;

  const ConstructorInput({
    Key? key,
    required this.label,
    this.controller,
    required this.message,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: _styleDropDownFormField(context),
      decoration: InputDecoration(
        focusColor: Colors.blue,
        contentPadding:
        const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: label,
        labelStyle: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color(0xFFDFE3E7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color(0xFFDFE3E7),
          ),
        ),
        suffixIcon: Tooltip(
          message: message,
          padding: const EdgeInsets.only(
              top: 16, bottom: 16, left: 16, right: 95),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xff4A5260),
          ),
          textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: Colors.white),
          child: const Icon(
            Icons.help_outline_outlined,
            color: Color(0xFFA7ADB4),
          ),
        ),
      ),
    );
  }

  _styleDropDownFormField(BuildContext context) {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 16,
    );
  }
}
