import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/components/dialog/action_btn.dart';
import 'package:queue_up/shared/components/dialog/dialog_overlay.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';
import 'package:queue_up/windows/settings/components/key_listener.dart';

class KeyCombinationTile extends StatefulWidget {
  const KeyCombinationTile({super.key});

  @override
  State<KeyCombinationTile> createState() => _KeyCombinationTileState();
}

class _KeyCombinationTileState extends State<KeyCombinationTile> {
  @override
  Widget build(BuildContext context) {
    return DialogOverlay(
      child: _KeyCombWidget(),
      options: [
        DialogOption(name: 'key-combination', content: _KeyCombinationDlg()),
      ],
    );
  }
}

class _KeyCombinationDlg extends StatelessWidget {
  const _KeyCombinationDlg({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DialogProvider>();
    return DialogContent(
      title: "Key Combination",
      subtitle: "Configure the key combination to trigger the overlay",
      actions: [
        // ActionBtn(onTap: controller.hide, text: 'Close', isPrimary: false),
        ActionBtn(onTap: () => {}, text: 'Save', isPrimary: true),
      ],
      children: [KeyListener()],
    );
  }
}

class _KeyCombWidget extends StatefulWidget {
  const _KeyCombWidget({super.key});

  @override
  State<_KeyCombWidget> createState() => __KeyCombWidgetState();
}

class __KeyCombWidgetState extends State<_KeyCombWidget> {
  late final controller = context.read<DialogProvider>();
  void openCombinationDlg(BuildContext context) =>
      controller.show(name: 'key-combination');

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(2),
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        title: Text('Key combination', style: TextStyle(fontSize: 15)),
        leading: Icon(Icons.merge),
        trailing: Material(
          borderRadius: BorderRadius.circular(2),
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          child: InkWell(
            onTap: () => openCombinationDlg(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                'Ctrl + K',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
