import 'package:flutter/material.dart';

class DropdownOption<T> {
  final T value;
  final DropdownMenuItem item;
  DropdownOption({required this.value, required this.item});
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
  final _overlayController = OverlayPortalController();

  // TODO: 
  void openDropdownMenu() {
    _overlayController.show();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder:
          (_) => ListTile(
            leading: Icon(widget.icon),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: openDropdownMenu,
            title: Text(
              widget.text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
    );
  }
}
