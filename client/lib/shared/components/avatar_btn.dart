import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart' as win;

class AvatarBtn extends StatefulWidget {
  const AvatarBtn({super.key});

  @override
  State<AvatarBtn> createState() => _AvatarBtnState();
}

class _AvatarBtnState extends State<AvatarBtn> with win.WindowListener {
  late final WindowController controller;

  void _init() async {
    controller = await WindowController.create(
      WindowConfiguration(
        hiddenAtLaunch: true,
        arguments: 'YOUR_WINDOW_ARGUMENTS_HERE',
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void createModal() => controller.show();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(1),
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: createModal,
              borderRadius: BorderRadius.circular(999),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  final double size =
                      constraints.maxHeight > constraints.maxWidth
                          ? constraints.maxWidth
                          : constraints.maxHeight;
                  return SizedBox(
                    width: size,
                    height: size,
                    child: Ink(
                      color: Theme.of(context).colorScheme.primary,
                      child: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
