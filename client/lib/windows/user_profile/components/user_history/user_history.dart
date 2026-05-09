import 'package:flutter/material.dart';
import 'package:queue_up/windows/room_history/components/history_action_tile.dart';
import 'package:queue_up/windows/room_history/models/action.dart';

class UserHistory extends StatelessWidget {
  const UserHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, index) {
        if (index == 9) {
          return HistoryActionTile(value: HistoryAction());
        }

        return Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: HistoryActionTile(value: HistoryAction()),
        );
      },
    );
  }
}
