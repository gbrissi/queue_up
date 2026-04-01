import 'package:flutter/material.dart';
import 'package:queue_up/services/shared_prefs.dart';

class MiscSettingsConfig {
  static bool isInit = false;
  static late bool initOnStartup;

  static Future<void> init() async {
    final bool? prefsInitOnStartup = await SharedPrefs.getInitOnStartup();
    initOnStartup = prefsInitOnStartup ?? false;
    isInit = true;
  }
}

class MiscSettingsProvider with ChangeNotifier {
  bool initOnStartup = MiscSettingsConfig.initOnStartup;

  void setInitOnStartup(bool value) async {
    await SharedPrefs.setInitOnStartup(value);
    initOnStartup = value;
    notifyListeners();
  }
}
