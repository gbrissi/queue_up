import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/providers/misc_settings_provider.dart';

class StartupToggleTile extends StatelessWidget {
  const StartupToggleTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MiscSettingsProvider>(
      builder: (_, p, __) {
        return SwitchListTile(
          tileColor: Theme.of(context).colorScheme.surfaceContainerLow,
          value: p.initOnStartup,
          title: Text("Init on Startup"),
          onChanged: (val) => p.setInitOnStartup(val),
        );
      },
    );
  }
}
