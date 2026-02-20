import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:queue_up/shared/components/windows_resize_btn.dart';

class WindowsTitleBar extends StatelessWidget {
  const WindowsTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    final btnColor = Theme.of(context).colorScheme.onPrimaryContainer;
    final barColor = Theme.of(context).colorScheme.primaryContainer;
    final winBtnColors = WindowButtonColors(iconNormal: btnColor);

    return Container(
      color: barColor,
      child: Row(
        children: [
          Expanded(child: SizedBox(height: 30, child: MoveWindow())),
          WindowTitleBarBox(
            child: Row(
              children: [
                MinimizeWindowButton(colors: winBtnColors),
                WindowsResizeBtn(colors: winBtnColors),
                CloseWindowButton(colors: winBtnColors),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
