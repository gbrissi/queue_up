import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queue_up/services/shared_prefs.dart';

class OverlaySettingsConfig {
  static bool isInit = false;
  static late ViewMode viewMode;
  static late OrientationMode orientationMode;
  static late LogicalKeyboardKey toggleViewBtn;

  static Future<void> init() async {
    final ViewMode? prefsViewMode = await SharedPrefs.getViewMode();
    final OrientationMode? prefsOM = await SharedPrefs.getOrientationMode();
    final LogicalKeyboardKey? prefsTGBTN = await SharedPrefs.getToggleViewBtn();

    viewMode = prefsViewMode ?? ViewMode.toggle;
    orientationMode = prefsOM ?? OrientationMode.horizontal;
    toggleViewBtn = prefsTGBTN ?? LogicalKeyboardKey.shift;
    isInit = true;
  }
}

class OverlaySettingsProvider with ChangeNotifier {
  ViewMode viewMode = OverlaySettingsConfig.viewMode;
  OrientationMode orientationMode = OverlaySettingsConfig.orientationMode;
  LogicalKeyboardKey toggleViewBtn = OverlaySettingsConfig.toggleViewBtn;

  void setViewMode(ViewMode mode) {
    viewMode = mode;
    SharedPrefs.setViewMode(mode);
    notifyListeners();
  }

  void setOrientationMode(OrientationMode mode) {
    orientationMode = mode;
    SharedPrefs.setOrientationMode(mode);
    notifyListeners();
  }

  void setToggleViewBtn(LogicalKeyboardKey key) {
    toggleViewBtn = key;
    SharedPrefs.setToggleViewBtn(key);
    notifyListeners();
  }
}
