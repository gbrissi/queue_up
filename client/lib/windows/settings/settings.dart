import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/services/shared_prefs.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/shared/providers/settings_provider.dart';
import 'package:queue_up/windows/settings/components/dropdown_tile.dart';

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
      child: ChangeNotifierProvider(
        create: (_) => SettingsProvider(),
        child: Builder(
          builder: (_) {
            return Consumer<SettingsProvider>(
              builder: (_, provider, __) {
                return Column(
                  children: [
                    DropdownTile<ViewMode>(
                      icon: Icons.mode_standby,
                      text: "Select View Toggle Mode",
                      items: viewModeOpts,
                      selectedItem: selectedViewMode,
                      onSelect: setViewMode,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
