import 'package:flutter/material.dart';

enum ThemeType { LIGHT, DARK }

class ThemeNotifier extends ChangeNotifier {
  var current = ThemeType.LIGHT;

  bool get isDarkModeEnable => current == ThemeType.DARK;

  getThemeData() {
    switch (current) {
      case ThemeType.LIGHT:
        return themeDataLight;
      case ThemeType.DARK:
        return themeDataDark;
      default:
        return themeDataLight;
    }
  }

  var themeDataLight = ThemeData(
    primarySwatch: Colors.green,
    backgroundColor: Colors.white,
    accentColor: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  var themeDataDark = ThemeData(
    primarySwatch: Colors.green,
    accentColor: Colors.blue,
    backgroundColor: Colors.grey[800],
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  setTheme() {
    isDarkModeEnable ? current = ThemeType.LIGHT : current = ThemeType.DARK;
    notifyListeners();
  }
}
