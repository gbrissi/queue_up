import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ViewMode {
  toggle,
  hold,
}

class SharedPrefs {
  static late final SharedPreferences prefs;
  static Future<void> init() async => prefs = await SharedPreferences.getInstance();

  final String viewModeKey = 'view-mode';
  Future<void> setViewMode(ViewMode mode) async {
    final String modeStr = mode.toString();
    await prefs.setString(viewModeKey, modeStr);
  }

  Future<ViewMode?> getViewMode() async {
    final String? modeStr = prefs.getString(viewModeKey);
    if(modeStr == null) return null;
    final ViewMode mode = ViewMode.values.firstWhere((e) => e.toString() == modeStr);
    return mode;
  }
  

  final String toggleViewKey  = 'toggle-view-btn';
  Future<void> setToggleViewBtn(LogicalKeyboardKey key) async {
    final int keyId = key.keyId;
    await prefs.setInt(toggleViewKey, keyId);
  }

  Future<LogicalKeyboardKey?> getToggleViewBtn() async {
    final int? keyId = prefs.getInt(viewModeKey);
    if(keyId == null) return null;
    final LogicalKeyboardKey key = LogicalKeyboardKey(keyId);
    return key;
  }
}

