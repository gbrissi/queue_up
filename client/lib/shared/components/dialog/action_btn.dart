import 'package:flutter/material.dart';

class ActionBtn extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final bool isPrimary;
  const ActionBtn({
    super.key,
    this.isPrimary = false,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        elevation: 2,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor:
                isPrimary ? Theme.of(context).colorScheme.primary : null,
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? Theme.of(context).colorScheme.onPrimary : null,
            ),
          ),
        ),
      ),
    );
  }
}
