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
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(4),
      elevation: 2,
      child: InkWell(
        onTap: () => addRoom(context),
        child: SizedBox(
          height: 64,
          width: double.infinity,
          child: Center(
            child: Icon(
              Icons.add,
              size: 24,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
