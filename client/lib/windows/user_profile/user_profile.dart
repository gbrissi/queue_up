import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/windows/user_profile/components/user_avatar/user_avatar.dart';
import 'package:queue_up/windows/user_profile/components/user_history/user_history.dart';
import 'package:queue_up/windows/user_profile/components/user_meta.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      enableScroll: false,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UserAvatar(),
            UserMeta(),
            SizedBox(height: 12),
            Expanded(child: UserHistory()),
          ],
        ),
      ),
    );
  }
}
