import 'package:flutter/material.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Room History',
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
