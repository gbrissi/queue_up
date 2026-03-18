import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queue_up/services/shared_prefs.dart';

class SettingsProvider extends ChangeNotifier {
  // Settings will include the following:
  // - Color palette
  // - Interact with Overlay Btn and Mode
  // - Orientation View Mode
  // - Sound Notifications
  bool isInit = false;
  late ViewMode viewMode;
  late LogicalKeyboardKey viewBtn; // Can be set to be a key combination
  late OrientationMode orientationMode;

  Future<void> init() async {
    isInit = true;
    viewMode = await SharedPrefs().getViewMode() ?? ViewMode.toggle;
    viewBtn = await SharedPrefs().getToggleViewBtn() ?? LogicalKeyboardKey.keyQ;
    orientationMode = await SharedPrefs().getOrientationMode() ?? OrientationMode.horizontal;
    notifyListeners();
  }
}