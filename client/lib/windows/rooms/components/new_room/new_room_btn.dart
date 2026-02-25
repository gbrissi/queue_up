import 'package:flutter/material.dart';
import 'package:queue_up/windows/rooms/components/new_room/new_room_dialog.dart';

class NewRoomBtn extends StatelessWidget {
  const NewRoomBtn({super.key});

  void addRoom(BuildContext ctx) {
    showDialog(context: ctx, builder: (_) => NewRoomDialog());
  }

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () => addRoom(context),
      icon: Icon(Icons.add),
    );
  }
}
