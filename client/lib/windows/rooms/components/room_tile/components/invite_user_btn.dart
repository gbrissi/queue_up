import 'package:flutter/material.dart';
import 'package:queue_up/windows/rooms/components/room_tile/components/invite_user_dlg.dart';

class InviteUserBtn extends StatelessWidget {
  const InviteUserBtn({super.key});

  void openInviteUserDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => const InviteUserDlg());
  }

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      iconSize: 16,
      splashRadius: 20,
      icon: const Icon(Icons.person_add_alt_1_outlined),
      onPressed: () => openInviteUserDialog(context),
    );
  }
}
