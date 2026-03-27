import 'package:flutter/material.dart';

class KeyCombinationTile extends StatelessWidget {
  const KeyCombinationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(2),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        title: Text('Key combination', style: TextStyle(fontSize: 15)),
        leading: Icon(Icons.merge),
        trailing: Material(
          borderRadius: BorderRadius.circular(2),
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              'Ctrl + K',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
