import 'package:flutter/material.dart';

class UserMeta extends StatelessWidget {
  const UserMeta({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TODO: Add last seen at
        Text(
          "#123456",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Text(
          "Gabriel TXT",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
