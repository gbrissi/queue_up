import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class WindowService {
  static final ValueNotifier<bool> isWindowSet = ValueNotifier(false);

  static init() {
    windowManager.ensureInitialized();
    windowManager.waitUntilReadyToShow(null, () async {
      await windowManager.setTitle('Queue Up!');
      await windowManager.center();
      final windowSize = const Size(450, 80);
      // final winPosition = await calcWindowPosition(
      //   windowSize,
      //   Alignment.bottomRight,
      // );

      // Overlay setup
      windowManager.setSize(windowSize);
      windowManager.setAlignment(Alignment.bottomRight);
      await windowManager.setAlwaysOnTop(true);
      await windowManager.setBackgroundColor(Colors.transparent);
      await windowManager.setSkipTaskbar(true);
      // Forward currently does not work
      // Workaround will be "Hold SHIFT" while clicking to ignore the window
      await windowManager.setIgnoreMouseEvents(false, forward: true);
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
      isWindowSet.value = true;
    });

    // TODO: Remove bitsdojo_window and replace every method with window_manager
    doWhenWindowReady(() {
      appWindow.show();
    });
  }
}
