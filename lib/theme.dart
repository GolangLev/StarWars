import 'package:flutter/material.dart';

ThemeData getTheme() => ThemeData(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      fontFamily: "Montserrat",
      buttonTheme: const ButtonThemeData(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: const Color(0xFF231F20),
    );
