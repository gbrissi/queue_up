import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';
import 'package:queue_up/windows/settings/dialogs/color_picker_dlg.dart';

class AddColorBtn extends StatelessWidget {
  const AddColorBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogOverlay(
      options: [DialogOption(name: 'color-picker', content: ColorPickerDlg())],
      child: const _AddColorBtnImpl(),
    );
  }
}

class _AddColorBtnImpl extends StatelessWidget {
  const _AddColorBtnImpl({super.key});

  void _addColor(BuildContext ctx) {
    final controller = ctx.read<DialogProvider>();
    controller.show(name: 'color-picker');
    print(controller.currentOption);
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
