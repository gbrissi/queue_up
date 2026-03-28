import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ViewMode { toggle, hold }

enum OrientationMode { horizontal, vertical }

class SharedPrefs {
  static late final SharedPreferences prefs;
  static Future<void> init() async =>
      prefs = await SharedPreferences.getInstance();

  final String viewModeKey = 'view-mode';
  Future<void> setViewMode(ViewMode mode) async {
    final String modeStr = mode.toString();
    await prefs.setString(viewModeKey, modeStr);
  }

  Future<ViewMode?> getViewMode() async {
    final String? modeStr = prefs.getString(viewModeKey);
    if (modeStr == null) return null;
    final ViewMode mode = ViewMode.values.firstWhere(
      (e) => e.toString() == modeStr,
    );
    return mode;
  }

  final String toggleViewKey = 'toggle-view-btn';
  Future<void> setToggleViewBtn(LogicalKeyboardKey key) async {
    final int keyId = key.keyId;
    await prefs.setInt(toggleViewKey, keyId);
  }

  Future<LogicalKeyboardKey?> getToggleViewBtn() async {
    final int? keyId = prefs.getInt(viewModeKey);
    if (keyId == null) return null;
    final LogicalKeyboardKey key = LogicalKeyboardKey(keyId);
    return key;
  }

  final String orientationModeKey = 'orientation-mode';
  Future<void> setOrientationMode(OrientationMode mode) async {
    final String modeStr = mode.toString();
    await prefs.setString(orientationModeKey, modeStr);
  }

  Future<OrientationMode?> getOrientationMode() async {
    final String? modeStr = prefs.getString(orientationModeKey);
    if (modeStr == null) return null;
    final OrientationMode mode = OrientationMode.values.firstWhere(
      (e) => e.toString() == modeStr,
    );
    return mode;
  }

  final String initOnStartupKey = "init-on-startup";
  Future<void> setInitOnStartup(bool value) async {
    await prefs.setBool(initOnStartupKey, value);
  }

  Future<bool?> getInitOnStartup() async {
    final bool? value = prefs.getBool(initOnStartupKey);
    return value;
  }

  // Theme
  static final String themeModeKey = "theme-mode";
  static Future<void> setThemeMode(ThemeMode value) async {
    await prefs.setInt(themeModeKey, value.index);
  }

  static Future<ThemeMode?> getThemeMode() async {
    final int? value = prefs.getInt(themeModeKey);
    if (value == null) return null;
    return ThemeMode.values[value];
  }

  static final String themeColorKey = "theme-color";
  static Future<void> setThemeColor(Color color) async {
    await prefs.setString(themeColorKey, color.toString());
  }

  static Future<Color?> getThemeColor() async {
    final String? value = prefs.getString(themeColorKey);
    if (value == null) return null;
    return Color(int.parse(value));
  }
}
