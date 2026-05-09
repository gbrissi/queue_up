import 'package:flutter/material.dart';
import 'package:queue_up/misc/txt_style.dart';
import 'package:queue_up/shared/components/base_window.dart';

class RoomSettings extends StatelessWidget {
  const RoomSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO:
    return BaseWindow(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text("Room Settings", style: TxtStyle.getHeadline(context)),
            SizedBox(height: 12),
            ListTile(title: Text("Room Name")),
          ],
        ),
      ),
    );
  }
}
