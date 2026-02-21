import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowManager {
  static init() {
    doWhenWindowReady(() {
      // TODO: Could dynamically increase the size
      const initialSize = Size(450, 80);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;

      windowManager.ensureInitialized();
      windowManager.waitUntilReadyToShow(null, () async {
        await windowManager.setTitle('Queue Up!');
        await windowManager.center();
        final winPosition = await calcWindowPosition(
          appWindow.size,
          Alignment.bottomRight,
        );

        // Overlay setup
        await windowManager.setPosition(winPosition, animate: false);
        await windowManager.setAlwaysOnTop(true);
        await windowManager.setBackgroundColor(Colors.transparent);
        await windowManager.setSkipTaskbar(true);
        // Forward currently does not work
        // Workaround will be "Hold SHIFT" while clicking to ignore the window
        await windowManager.setIgnoreMouseEvents(false, forward: true);
        await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
      });

      appWindow.show();
    });
  }
}
