import 'package:flutter/material.dart';
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
