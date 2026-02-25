import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowsResizeBtn extends StatefulWidget {
  final WindowButtonColors colors;
  const WindowsResizeBtn({super.key, required this.colors});

  @override
  State<WindowsResizeBtn> createState() => _WindowsResizeBtnState();
}

class _WindowsResizeBtnState extends State<WindowsResizeBtn> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return appWindow.isMaximized
        ? RestoreWindowButton(
          colors: widget.colors,
          onPressed: maximizeOrRestore,
        )
        : MaximizeWindowButton(
          colors: widget.colors,
          onPressed: maximizeOrRestore,
        );
  }
}
