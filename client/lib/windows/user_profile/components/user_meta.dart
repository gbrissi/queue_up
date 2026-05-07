import 'package:flutter/material.dart';

class UserMeta extends StatelessWidget {
  const UserMeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TODO: Add last seen at
        Text(
          "Last seen at 12/12/2022",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          "Gabriel TXT",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Text(
          "#123456",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ],
    );
  }
}
