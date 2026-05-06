import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/windows/user_profile/components/user_avatar.dart';
import 'package:queue_up/windows/user_profile/components/user_meta.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [UserAvatar(), UserMeta()],
      ),
    );
  }
}
