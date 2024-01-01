
import 'package:flutter/material.dart';

class ThemeColor {
  static Color getAppBackgroundColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return const Color(0xFF212121);
    } else {
      return const Color(0xFFFFFFFF);
    }
  }
  static Color getAppForegroundColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return const Color(0xFFFFFFFF);
    } else {
      return const Color(0xFF212121);
    }
  }

  static Color getAppIconColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return Colors.grey;
    } else {
      return const Color(0xFF212121);
    }
  }
}