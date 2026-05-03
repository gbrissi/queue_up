import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/misc/txt_style.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/shared/providers/misc_settings_provider.dart';
import 'package:queue_up/shared/providers/overlay_settings_provider.dart';
import 'package:queue_up/windows/settings/components/key_combination_tile.dart';
import 'package:queue_up/windows/settings/components/seed_color_opts.dart';
import 'package:queue_up/windows/settings/components/startup_toggle_tile.dart';
import 'package:queue_up/windows/settings/components/theme_toggle_tile.dart';
import 'package:queue_up/windows/settings/components/user_profile_tile.dart';
import 'package:queue_up/windows/settings/components/view_toggle_mode_tile.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text("Settings", style: TxtStyle.getHeadline(context)),
          SizedBox(height: 12),

          // User
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text("User Profile", style: TxtStyle.getTitle(context)),
              UserProfileTile(),
            ],
          ),
          // Overlay
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text("Overlay", style: TxtStyle.getTitle(context)),
              ChangeNotifierProvider(
                create: (_) => OverlaySettingsProvider(),
                child: Column(
                  spacing: 12,
                  children: [ViewToggleModeTile(), KeyCombinationTile()],
                ),
              ),
            ],
          ),
          // Theme
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Text("Theme", style: TxtStyle.getTitle(context)),
              ThemeToggleTile(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text("Select a seed color", style: TextStyle(fontSize: 15)),
                  SeedColorOpts(),
                ],
              ),
            ],
          ),
          // Miscellaneous
          ChangeNotifierProvider(
            create: (_) => MiscSettingsProvider(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Text("Miscellaneous", style: TxtStyle.getTitle(context)),
                StartupToggleTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
