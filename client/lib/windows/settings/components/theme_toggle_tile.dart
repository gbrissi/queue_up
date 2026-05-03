import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/providers/theme_provider.dart';

class ThemeToggleTile extends StatelessWidget {
  const ThemeToggleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(2),
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Consumer<ThemeProvider>(
        builder: (_, p, __) {
          return SwitchListTile(
            value: p.isDarkMode,
            title: Text("Dark Mode"),
            onChanged: (_) => p.toggleTheme(),
          );
        },
      ),
    );
  }
}
