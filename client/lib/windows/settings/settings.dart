import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/services/shared_prefs.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/shared/providers/settings_provider.dart';
import 'package:queue_up/windows/settings/components/dropdown_tile.dart';
import 'package:queue_up/windows/settings/components/key_combination_tile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // View Mode Variables
  late DropdownOption<ViewMode> selectedViewMode = viewModeOpts[0];
  void setViewMode(opt) => setState(() => selectedViewMode = opt);
  final List<DropdownOption<ViewMode>> viewModeOpts = [
    DropdownOption(value: ViewMode.toggle, name: "Toggle"),
    DropdownOption(value: ViewMode.hold, name: "Hold"),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Overlay",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12),
          ChangeNotifierProvider(
            create: (_) => SettingsProvider(),
            child: Builder(
              builder: (_) {
                return Consumer<SettingsProvider>(
                  builder: (_, provider, __) {
                    return Column(
                      children: [
                        DropdownTile<ViewMode>(
                          icon: Icons.view_carousel,
                          text: "Select view toggle mode",
                          items: viewModeOpts,
                          selectedItem: selectedViewMode,
                          onSelect: setViewMode,
                        ),
                        SizedBox(height: 8),
                        KeyCombinationTile(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Theme",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
