import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/custom_search_bar.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(hint: 'Search for an action');
  }
}
