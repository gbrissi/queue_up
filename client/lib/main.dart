import 'package:flutter/material.dart';
import 'package:queue_up/app.dart';
import 'package:queue_up/services/window_manager.dart';

void main() {
  runApp(const App());
  WindowManager.init();
}
