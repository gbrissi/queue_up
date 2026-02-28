import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';
import 'package:queue_up/windows/rooms/components/new_room/dialogs/new_room_dlg.dart';

class NewRoomBtn extends StatelessWidget {
  const NewRoomBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogOverlay(
      options: [DialogOption(name: 'new-room', content: NewRoomDlg())],
      child: const _NewRoomImpl(),
    );
  }
}

class _NewRoomImpl extends StatefulWidget {
  const _NewRoomImpl();

  @override
  State<_NewRoomImpl> createState() => _NewRoomImplState();
}

class _NewRoomImplState extends State<_NewRoomImpl> {
  late final _dlgProvider = context.read<DialogProvider>();
  void _openNewRoomDlg() => _dlgProvider.show(name: 'new-room');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainerHigh,
      borderRadius: BorderRadius.circular(4),
      elevation: 2,
      child: InkWell(
        onTap: _openNewRoomDlg,
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
