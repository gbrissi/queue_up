import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';
import 'package:queue_up/windows/rooms/components/new_room/new_room_tile.dart';

class NewRoomDlg extends StatelessWidget {
  const NewRoomDlg({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogContent(
      title: 'New Room',
      subtitle: 'Create a new room or join another one!',
      children: [
        NewRoomTile(icon: Icons.add_circle, name: "New Room", onPressed: () {}),
        SizedBox(height: 4),
        NewRoomTile(
          icon: Icons.join_full,
          name: "Join a Room",
          onPressed: () {},
        ),
      ],
    );
  }
}
