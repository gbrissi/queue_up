import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowManager {
  static init() {
    doWhenWindowReady(() {
      const initialSize = Size(600, 450);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;

      windowManager.ensureInitialized();
      // Always on top behavior (currently deactivated)
      WindowOptions windowOptions = const WindowOptions(alwaysOnTop: false);
      windowManager.waitUntilReadyToShow(windowOptions, () async {});

      appWindow.show();
    });
  }
}
