
import 'package:flutter/material.dart';

class ThemeColor {
  static Color getIconButtonBackgroundColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return const Color(0xFF212121);
    } else {
      return const Color(0xFFFFFFFF);
    }
  }
  static Color getIconButtonOverlayColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return const Color(0xFF515151);
    } else {
      return const Color(0xFFBBBBBB);
    }
  }
  static Color getDialogBackgroundColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return const Color(0xFF303030);
    } else {
      return const Color(0xFFFFFFFF);
    }
  }
  static Color getAppBackgroundColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return const Color(0xFF000000);
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
      return const Color(0xFF000000);
    }
  }
  static Color getAppScaffoldColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return const Color(0xFF000000);
    } else {
      return const Color(0xFFEEEEEE);
    }
  }
  static Color getAppIconColor({required BuildContext context}) {
    ThemeMode currentThemeMode = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    if (currentThemeMode == ThemeMode.dark) {
      return Colors.grey;
    } else {
      return const Color(0xFF000000);
    }
  }
}