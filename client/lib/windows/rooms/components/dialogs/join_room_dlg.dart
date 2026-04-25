import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';

class JoinRoomDlg extends StatefulWidget {
  const JoinRoomDlg({super.key});

  @override
  State<JoinRoomDlg> createState() => _JoinRoomDlgState();
}

class _JoinRoomDlgState extends State<JoinRoomDlg> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DialogContent(
      title: 'Join Room',
      subtitle: 'Enter a Room Code!',
      children: [
        SizedBox(height: 12),
        TextField(
          controller: _controller,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: 'Insert Room Code',
            labelText: 'Room Code',
            suffixIcon: Icon(Icons.label),
            border: OutlineInputBorder(borderSide: BorderSide()),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ],
    );
  }
}
