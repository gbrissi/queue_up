import 'package:flutter/material.dart';
import 'package:queue_up/app.dart';
import 'package:queue_up/services/shared_prefs.dart';
import 'package:queue_up/services/tray_manager.dart';
import 'package:queue_up/services/window_service.dart';
import 'package:queue_up/shared/providers/theme_provider.dart';
import 'package:queue_up/windows/settings/providers/color_options_provider.dart';

Future<void> main() async {
  runApp(const App());
  TrayService.init();
  WindowService.init();
  await SharedPrefs.init();
  await ThemeConfig.init();
  // await COConfig.init();
}
