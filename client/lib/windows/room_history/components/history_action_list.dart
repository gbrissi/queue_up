import 'package:flutter/material.dart';
import 'package:queue_up/windows/room_history/components/history_action_tile.dart';
import 'package:queue_up/windows/room_history/models/action.dart';

class HistoryActionList extends StatelessWidget {
  HistoryActionList({super.key});
  final List<HistoryAction> actions = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: actions.length,
      itemBuilder: (_, index) => HistoryActionTile(value: actions[index]),
    );
  }
}
