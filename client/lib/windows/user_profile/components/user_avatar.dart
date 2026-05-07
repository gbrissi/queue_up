import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48));
  }
}
