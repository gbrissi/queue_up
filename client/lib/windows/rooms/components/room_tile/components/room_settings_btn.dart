import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';

class SettingsBtn extends StatefulWidget {
  const SettingsBtn({super.key});

  @override
  State<SettingsBtn> createState() => _SettingsBtnState();
}

class _SettingsBtnState extends State<SettingsBtn> {
  // Props
  final MenuController _menuController = MenuController();
  late final _dlgProvider = context.read<DialogProvider>();

  // Methods
  void openRoomSettings() => _dlgProvider.show(name: 'room-settings');

  void _toggleRoomOpts() =>
      _menuController.isOpen ? _menuController.close() : _menuController.open();

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: MenuController(),
      menuChildren: [
        MenuItemButton(onPressed: openRoomSettings, child: Text('Settings')),
      ],
      child: IconButton(
        onPressed: _toggleRoomOpts,
        icon: Icon(Icons.more_vert),
      ),
    );
  }
}
