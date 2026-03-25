import 'package:flutter/material.dart';

class DropdownOption<T> {
  final T value;
  final IconData? icon;
  late final String name;
  DropdownOption({required this.value, String? name, this.icon}) {
    this.name = name ?? value.toString();
  }
}

class DropdownTile<T> extends StatefulWidget {
  final IconData icon;
  final String text;
  final DropdownOption<T> selectedItem;
  final List<DropdownOption<T>> items;
  final void Function(DropdownOption<T> item) onSelect;
  const DropdownTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onSelect,
    required this.items,
    required this.selectedItem,
  });

  @override
  State<DropdownTile<T>> createState() => _DropdownTileState<T>();
}

class _DropdownTileState<T> extends State<DropdownTile<T>> {
  final MenuController _menuController = MenuController();
  void _toggleMenu() =>
      _menuController.isOpen ? _menuController.close() : _menuController.open();

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: _menuController,
      menuChildren:
          widget.items.map((item) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(item.icon),
                  SizedBox(width: 8),
                  Text(item.name),
                ],
              ),
            );
          }).toList(),
      child: ListTile(
        onTap: _toggleMenu,
        leading: Icon(widget.icon),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        trailing: Icon(Icons.chevron_right),
        title: Text(
          widget.text,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
