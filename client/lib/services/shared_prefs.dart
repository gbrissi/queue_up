import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queue_up/extensions/hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ViewMode { toggle, hold }

enum OrientationMode { horizontal, vertical }

class SharedPrefs {
  static late final SharedPreferences prefs;
  static Future<void> init() async =>
      prefs = await SharedPreferences.getInstance();

  static final String viewModeKey = 'view-mode';
  static Future<void> setViewMode(ViewMode mode) async {
    final String modeStr = mode.toString();
    await prefs.setString(viewModeKey, modeStr);
  }

  static Future<ViewMode?> getViewMode() async {
    final String? modeStr = prefs.getString(viewModeKey);
    if (modeStr == null) return null;
    final ViewMode mode = ViewMode.values.firstWhere(
      (e) => e.toString() == modeStr,
    );
    return mode;
  }

  static final String toggleViewKey = 'toggle-view-btn';
  static Future<void> setToggleViewBtn(LogicalKeyboardKey key) async {
    final int keyId = key.keyId;
    await prefs.setInt(toggleViewKey, keyId);
  }

  static Future<LogicalKeyboardKey?> getToggleViewBtn() async {
    final int? keyId = prefs.getInt(viewModeKey);
    if (keyId == null) return null;
    final LogicalKeyboardKey key = LogicalKeyboardKey(keyId);
    return key;
  }

  static final String orientationModeKey = 'orientation-mode';
  static Future<void> setOrientationMode(OrientationMode mode) async {
    final String modeStr = mode.toString();
    await prefs.setString(orientationModeKey, modeStr);
  }

  static Future<OrientationMode?> getOrientationMode() async {
    final String? modeStr = prefs.getString(orientationModeKey);
    if (modeStr == null) return null;
    final OrientationMode mode = OrientationMode.values.firstWhere(
      (e) => e.toString() == modeStr,
    );
    return mode;
  }

  static final String initOnStartupKey = "init-on-startup";
  static Future<void> setInitOnStartup(bool value) async {
    await prefs.setBool(initOnStartupKey, value);
  }

  static Future<bool?> getInitOnStartup() async {
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
    final String hexColor = color.toHex();
    await prefs.setString(themeColorKey, hexColor);
  }

  static Future<Color?> getThemeColor() async {
    final String? value = prefs.getString(themeColorKey);
    if (value == null) return null;
    return HexColor.fromHex(value);
  }
}
