import 'package:flutter/material.dart';
import 'package:queue_up/windows/settings/dialogs/color_picker_dlg.dart';

class AddColorBtn extends StatelessWidget {
  const AddColorBtn({super.key});

  void _addColor(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) {
        return ColorPickerDlg();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: Material(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(999),
          child: InkWell(
            onTap: () => _addColor(context),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
