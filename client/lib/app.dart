import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:queue_up/pages/home/home.dart';
import 'package:queue_up/shared/components/avatar_btn.dart';
import 'package:queue_up/shared/components/tray_widget.dart';
import 'package:queue_up/shared/components/windows_title_bar.dart';
import 'package:window_manager/window_manager.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<void> _handlePointer(PointerEvent event) async {
    if (event is PointerDownEvent || event is PointerUpEvent) {
      // TODO:
    }
  }

  @override
  void initState() {
    super.initState();
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointer);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(child: AvatarBtn()),
    );
  }
}
