import 'package:flutter/material.dart';
import 'package:queue_up/services/shared_prefs.dart';

class ThemeConfig {
  static bool isInit = false;
  static late ThemeMode themeMode;
  static late Color seedColor;

  static Future<void> init() async {
    final Color? prefsColor = await SharedPrefs.getThemeColor();
    final ThemeMode? prefsTheme = await SharedPrefs.getThemeMode();
    seedColor = prefsColor ?? dfltColor;
    themeMode = prefsTheme ?? systemTheme;
    isInit = true;
  }

  static Color get dfltColor => Colors.deepPurple;
  static ThemeMode get systemTheme =>
      ThemeMode.system.name == 'dark' ? ThemeMode.dark : ThemeMode.light;
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeConfig.themeMode;
  ThemeMode get themeMode => ThemeConfig.themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  Brightness get brightness => isDarkMode ? Brightness.dark : Brightness.light;

  Color _seedColor = ThemeConfig.seedColor;
  Color get seedColor => _seedColor;

  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void setSeedColor(Color color) {
    _seedColor = color;
    notifyListeners();
  }
}
