import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class AvatarBtn extends StatefulWidget {
  const AvatarBtn({super.key});

  @override
  State<AvatarBtn> createState() => _AvatarBtnState();
}

class _AvatarBtnState extends State<AvatarBtn> with WindowListener {
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
              onTap: () => print("tap"),
              borderRadius: BorderRadius.circular(999),
              child: Ink(
                color: Theme.of(context).colorScheme.primary,
                child: SizedBox(
                  height: 52,
                  width: 52,
                  child: const Icon(Icons.person),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
