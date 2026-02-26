import 'package:flutter/material.dart';
import 'package:queue_up/windows/rooms/components/room_tile/components/user_dlg.dart';
import 'package:queue_up/windows/rooms/components/room_tile/room_tile.dart';

class User extends StatelessWidget {
  const User({super.key, required this.data});
  final UserCore data;

  void openUserDlg(BuildContext context) {
    showDialog(context: context, builder: (_) => UserDlg());
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(
          onTap: () => openUserDlg(context),
          child: Image.network(data.avatarUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
