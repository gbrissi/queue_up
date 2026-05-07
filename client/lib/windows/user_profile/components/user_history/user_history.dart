import 'package:flutter/material.dart';
import 'package:queue_up/windows/user_profile/components/user_history/components/user_history_tile.dart';

class UserHistory extends StatelessWidget {
  const UserHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, index) => const UserHistoryTile(),
    );
  }
}
