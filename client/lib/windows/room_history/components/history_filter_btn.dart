import 'package:flutter/material.dart';

class HistoryFilterBtn extends StatefulWidget {
  const HistoryFilterBtn({super.key});

  @override
  State<HistoryFilterBtn> createState() => _HistoryFilterBtnState();
}

class _HistoryFilterBtnState extends State<HistoryFilterBtn> {
  final MenuController _menuController = MenuController();

  void _toggleMenu() =>
      _menuController.isOpen ? _menuController.close() : _menuController.open();

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: _menuController,
      menuChildren: const [Text("test")],
      child: ElevatedButton.icon(
        onPressed: _toggleMenu,
        icon: Icon(Icons.tune),
        label: Text('Filter'),
        style: ButtonStyle(
          mouseCursor: WidgetStatePropertyAll(SystemMouseCursors.click),
        ),
      ),
    );
  }
}
