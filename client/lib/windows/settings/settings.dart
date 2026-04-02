import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/services/shared_prefs.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/shared/providers/misc_settings_provider.dart';
import 'package:queue_up/shared/providers/overlay_settings_provider.dart';
import 'package:queue_up/shared/providers/theme_provider.dart';
import 'package:queue_up/windows/settings/components/color_option.dart';
import 'package:queue_up/windows/settings/components/dropdown_tile.dart';
import 'package:queue_up/windows/settings/components/key_combination_tile.dart';
import 'package:queue_up/windows/settings/providers/color_options_provider.dart';

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

  void openKeyCombDlg() {}

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
            create: (_) => OverlaySettingsProvider(),
            child: Builder(
              builder: (_) {
                return Consumer<OverlaySettingsProvider>(
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
          SizedBox(height: 12),
          Material(
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
          ),
          SizedBox(height: 12),
          Text("Select a seed color", style: TextStyle(fontSize: 15)),
          SizedBox(height: 4),
          Material(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Wrap(
                spacing: 2,
                runSpacing: 2,
                children: List.generate(
                  defaultColors.length,
                  (i) => ColorOption(color: defaultColors[i]),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Miscellaneous",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 12),
          ChangeNotifierProvider(
            create: (_) => MiscSettingsProvider(),
            child: Builder(
              builder: (_) {
                return Consumer<MiscSettingsProvider>(
                  builder:
                      (_, p, __) => SwitchListTile(
                        tileColor:
                            Theme.of(context).colorScheme.surfaceContainerLow,
                        value: p.initOnStartup,
                        title: Text("Init on Startup"),
                        onChanged: (val) => p.setInitOnStartup(val),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
