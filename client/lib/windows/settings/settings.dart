import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/services/shared_prefs.dart';
import 'package:queue_up/shared/providers/settings_provider.dart';
import 'package:queue_up/windows/settings/components/dropdown_tile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (_, provider, __) {
        return Column(
          children: [
            // View Mode (Toggle/Hold)
            // View Key
            // Orientation
            DropdownTile<ViewMode>(
              icon: Icons.mode_standby,
              text: "Select View Toggle Mode",
              selectedItem: DropdownOption(value: provider.viewMode, item: item),
            )
          ],
        );
      }
    );
  }
}