import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/menu_btn.dart';
import 'package:queue_up/shared/components/windows_title_bar/windows_title_bar.dart';

class BaseWindow extends StatelessWidget {
  const BaseWindow({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        elevation: 2,
        shadowColor: Colors.black,
        child: Column(
          children: [
            WindowsTitleBar(),
            Expanded(
              child: Stack(
                children: [
                  Align(alignment: Alignment.topRight, child: MenuBtn()),
                  Padding(padding: EdgeInsets.all(24), child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
