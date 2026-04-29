import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/windows/room_history/components/history_action_list.dart';
import 'package:queue_up/windows/room_history/components/history_search_bar.dart';
import 'package:queue_up/windows/room_history/components/history_title.dart';

class RoomHistory extends StatelessWidget {
  const RoomHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HistoryTitle(),
          SizedBox(height: 24),
          HistorySearchBar(),
          SizedBox(height: 12),
          HistoryActionList(),
        ],
      ),
    );
  }
}
