import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowManager {
  static init() {
    doWhenWindowReady(() {
      const initialSize = Size(600, 450);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;

      windowManager.ensureInitialized();
      windowManager.waitUntilReadyToShow(null, () async {
        await windowManager.setTitle('Queue Up!');
        await windowManager.center();

        // Overlay setup
        await windowManager.setAlwaysOnTop(true);
        await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
        await windowManager.setBackgroundColor(Colors.transparent);
        await windowManager.setSkipTaskbar(true);
        // Forward currently does not work
        // Only limitation to the development of the application
        // WORKAROUND
        // Could listen to every mouse event and use some sort of
        // pre-hook to setIgnoreMouseEvents(true) when needed
        // https://github.com/flutter/flutter/issues/134652
        // https://github.com/helgoboss/pointer_lock could be a solution

        await windowManager.setIgnoreMouseEvents(false, forward: true);
      });

      appWindow.show();
    });
  }
}
