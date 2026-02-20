import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class TrayWidget extends StatefulWidget {
  final Widget child;
  const TrayWidget({super.key, required this.child});

  @override
  State<TrayWidget> createState() => _TrayWidgetState();
}

class _TrayWidgetState extends State<TrayWidget> with TrayListener {
  @override
  void initState() {
    trayManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    trayManager.removeListener(this);
    super.dispose();
  }

  @override
  void onTrayIconRightMouseDown() {
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayIconMouseDown() {
    windowManager.focus();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    if (menuItem.key == 'exit_app') {
      if (Platform.isWindows) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
    } else if (menuItem.key == 'show_window') {
      windowManager.focus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
