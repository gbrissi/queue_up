import 'package:flutter/material.dart';
import 'package:queue_up/windows/rooms/components/new_room/new_room_dlg.dart';

class NewRoomBtn extends StatelessWidget {
  const NewRoomBtn({super.key});

  void addRoom(BuildContext ctx) {
    showDialog(context: ctx, builder: (_) => NewRoomDlg());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Fake tile
    return IconButton.filled(
      onPressed: () => addRoom(context),
      iconSize: 24,
      splashRadius: 72,
      icon: Icon(Icons.add),
    );
  }
}
