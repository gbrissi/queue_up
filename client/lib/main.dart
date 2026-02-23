import 'package:flutter/material.dart';
import 'package:queue_up/app.dart';
import 'package:queue_up/services/tray_manager.dart';
import 'package:queue_up/services/window_service.dart';

void main() {
  runApp(const App());
  TrayService.init();
  WindowService.init();
}
