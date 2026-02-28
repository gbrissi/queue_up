import 'package:flutter/material.dart';

class NewRoomTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final VoidCallback onPressed;
  const NewRoomTile({
    super.key,
    required this.icon,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        name,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: onPressed,
    );
  }
}
