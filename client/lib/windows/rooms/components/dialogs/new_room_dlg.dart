import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';
import 'package:queue_up/windows/new_room/new_room.dart';
import 'package:queue_up/windows/rooms/components/new_room/new_room_tile.dart';

class NewRoomDlg extends StatelessWidget {
  const NewRoomDlg({super.key});

  DialogProvider _getController(BuildContext ctx) {
    final controller = ctx.read<DialogProvider>();
    return controller;
  }

  void _navigateToNewRoomScrn(BuildContext ctx) {
    final controller = _getController(ctx);
    controller.hide();
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => const NewRoom()));
  }

  void _openJoinRoomDlg(BuildContext ctx) {
    final controller = _getController(ctx);
    controller.show(name: 'join-room');
  }

  @override
  Widget build(BuildContext context) {
    return DialogContent(
      title: 'New Room',
      subtitle: 'Create a new room or join another one!',
      children: [
        NewRoomTile(
          icon: Icons.add_circle,
          name: "New Room",
          onPressed: () => _navigateToNewRoomScrn(context),
        ),
        SizedBox(height: 4),
        NewRoomTile(
          icon: Icons.join_full,
          name: "Join a Room",
          onPressed: () => _openJoinRoomDlg(context),
        ),
      ],
    );
  }
}
