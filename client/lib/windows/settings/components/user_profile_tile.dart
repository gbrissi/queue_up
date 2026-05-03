import 'package:flutter/material.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key});

  void _openLogoutDlg() {}

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(2),
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Row(
                spacing: 8,
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#123456',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.color!.withValues(alpha: 0.8),
                        ),
                      ),

                      Text(
                        'Gabriel TXT',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: _openLogoutDlg,
              icon: Icon(Icons.logout, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
