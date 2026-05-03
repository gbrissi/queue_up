import 'package:flutter/material.dart';
import 'package:queue_up/services/shared_prefs.dart';
import 'package:queue_up/windows/settings/components/dropdown_tile.dart';

class ViewToggleModeTile extends StatefulWidget {
  const ViewToggleModeTile({super.key});

  @override
  State<ViewToggleModeTile> createState() => _ViewToggleModeTileState();
}

class _ViewToggleModeTileState extends State<ViewToggleModeTile> {
  late DropdownOption<ViewMode> selectedViewMode = viewModeOpts[0];
  void setViewMode(opt) => setState(() => selectedViewMode = opt);
  final List<DropdownOption<ViewMode>> viewModeOpts = [
    DropdownOption(value: ViewMode.toggle, name: "Toggle"),
    DropdownOption(value: ViewMode.hold, name: "Hold"),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownTile<ViewMode>(
      icon: Icons.view_carousel,
      text: "Select view toggle mode",
      items: viewModeOpts,
      selectedItem: selectedViewMode,
      onSelect: setViewMode,
    );
  }
}
