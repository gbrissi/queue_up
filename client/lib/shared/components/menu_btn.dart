import 'package:flutter/material.dart';
import 'package:queue_up/windows/rooms/rooms.dart';
import 'package:queue_up/windows/settings/settings.dart';

class MenuBtn extends StatefulWidget {
  const MenuBtn({super.key});

  @override
  State<MenuBtn> createState() => _MenuBtnState();
}

class _MenuBtnState extends State<MenuBtn> {
  final _menuController = MenuController();
  void toggleMenu() =>
      _menuController.isOpen ? _menuController.close() : _menuController.open();

  // TODO: Create named routes
  void navigateToRooms() => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (_) => const Rooms()));

  void navigateToSettings() => Navigator.of(
    context,
  ).push(MaterialPageRoute(builder: (_) => const Settings()));

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: _menuController,
      menuChildren: [
        MenuItemButton(onPressed: navigateToSettings, child: Text('Settings')),
        MenuItemButton(onPressed: navigateToRooms, child: Text('Rooms')),
      ],
      child: IconButton(
        onPressed: toggleMenu,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.more_horiz, size: 18),
      ),
    );
  }
}
