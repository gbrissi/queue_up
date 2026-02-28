import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/dialog_base.dart';
import 'package:queue_up/windows/rooms/components/new_room/new_room_tile.dart';

class NewRoomDlg extends StatelessWidget {
  const NewRoomDlg({super.key});

  void joinRoom(BuildContext ctx) {
    Navigator.pop(ctx);
    showDialog(context: ctx, builder: (_) => const NewRoomDlg());
  }

  @override
  Widget build(BuildContext context) {
    return DialogBase(
      title: 'New Room',
      subtitle: 'Create a new room or join another one!',
      children: [
        NewRoomTile(icon: Icons.add_circle, name: "New Room", onPressed: () {}),
        NewRoomTile(
          icon: Icons.join_full,
          name: "Join a Room",
          onPressed: () => joinRoom(context),
        ),
      ],
      // actions: [
      //   MaterialButton(
      //     elevation: 1,
      //     color: Theme.of(context).colorScheme.secondaryContainer,
      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      //     onPressed: () => Navigator.pop(context),
      //     child: Text(
      //       'Cancel',
      //       style: TextStyle(
      //         color: Theme.of(context).colorScheme.onSecondaryContainer,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
