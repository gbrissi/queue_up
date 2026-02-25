import 'package:flutter/material.dart';

class NewRoomDialog extends StatelessWidget {
  const NewRoomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // Title, Description, Create Mine Btn, Join Btn
      child: Column(
        children: [
          Column(
            children: [
              Text(
                "New Room",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Create a new room or join one!",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            children: [
              // TODO: Add chevron and Icons to tiles
              ListTile(title: Text("Create Room")),
              ListTile(title: Text("Join Room")),
            ],
          ),
        ],
      ),
    );
  }
}
