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
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        tileColor: Theme.of(context).colorScheme.surfaceContainer,
        leading: Icon(icon),
        trailing: Icon(Icons.chevron_right),
        onTap: onPressed,
        title: Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
