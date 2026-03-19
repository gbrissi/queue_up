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
          (_) => Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(2),
            child: Column(
              children: List.generate(
                widget.items.length,
                (i) => DropdownMenuItem(
                  onTap: () => widget.onSelect(widget.items[i]),
                  child: Row(
                    children: [
                      Icon(widget.items[i].icon),
                      SizedBox(width: 4),
                      Text(widget.items[i].name),
                    ],
                  ),
                ),
              ),
            ),
          ),
      child: ListTile(
        leading: Icon(widget.icon),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
