import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';

class ColorPickerDlg extends StatefulWidget {
  const ColorPickerDlg({super.key});

  @override
  State<ColorPickerDlg> createState() => _ColorPickerDlgState();
}

class _ColorPickerDlgState extends State<ColorPickerDlg> {
  Color _pickerColor = Colors.red;
  void _setPickerColor(Color value) => setState(() {
    _pickerColor = value;
  });

  // TODO: Return Color after it's saved
  @override
  Widget build(BuildContext context) {
    return DialogContent(
      title: 'Color Picker',
      subtitle: 'Select a color',
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _pickerColor),
          child: const Text('Save'),
        ),
      ],
      children: [
        ColorPicker(
          pickerColor: _pickerColor,
          onColorChanged: _setPickerColor,
          enableAlpha: false,
        ),
      ],
    );
  }
}
