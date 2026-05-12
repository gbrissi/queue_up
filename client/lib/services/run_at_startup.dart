import 'dart:io';

import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:queue_up/services/shared_prefs.dart';

class RunAtStartup {
  static bool _initOnStartup = false;
  static bool isInit = false;

  static Future<void> init() async {
    launchAtStartup.setup(
      appName: 'Queue Up',
      appPath: Platform.resolvedExecutable,
    );

    bool? prefsInitOnStartup = await SharedPrefs.getInitOnStartup();
    _initOnStartup = prefsInitOnStartup ?? false;
    isInit = true;

    bool launchAtStartupSystem = await launchAtStartup.isEnabled();
    if (launchAtStartupSystem != _initOnStartup) {
      // If the system setting is different from the app setting, update the system setting
      await launchAtStartup.enable();
    }

    isInit = true;
  }
}
