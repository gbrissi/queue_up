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

      WindowOptions windowOptions = const WindowOptions(
        // Always on top behavior (currently deactivated)
        // Should be applied when the window is transparent
        alwaysOnTop: false,
        // Transparent behavior test
        // titleBarStyle: TitleBarStyle.hidden,
        // backgroundColor: Colors.transparent,
      );

      windowManager.ensureInitialized();
      windowManager.waitUntilReadyToShow(windowOptions, () async {
        // await windowManager.setAsFrameless();
        await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
        await windowManager.setBackgroundColor(Colors.transparent);
      });

      appWindow.show();
    });
  }
}
