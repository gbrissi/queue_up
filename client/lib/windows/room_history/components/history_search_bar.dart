import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/custom_search_bar.dart';
import 'package:queue_up/windows/room_history/components/history_filter_btn.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 4,
      children: [
        CustomSearchBar(hint: 'Search for an action'),
        HistoryFilterBtn(),
      ],
    );
  }
}
