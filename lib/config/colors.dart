
import 'package:flutter/material.dart';

class ThemeColor {
  static Color getDrawerBackground({required ThemeMode themeMode}) {
    switch(themeMode) {
      case ThemeMode.dark: {
        return const Color.fromRGBO(0, 0, 0, 0.5);
      }
      case ThemeMode.light: {
        return const Color.fromRGBO(255, 255, 255, 0.5);
      }
      default: {
        return const Color.fromRGBO(0, 0, 0, 0.5);
      }
    }
  }
}