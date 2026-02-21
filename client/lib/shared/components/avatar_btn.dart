import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class AvatarBtn extends StatefulWidget {
  const AvatarBtn({super.key});

  @override
  State<AvatarBtn> createState() => _AvatarBtnState();
}

class _AvatarBtnState extends State<AvatarBtn> with WindowListener {
  void test() {
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => test(),
      onExit: (event) => test(),
      child: ElevatedButton(onPressed: () {}, child: Text("test")),
    );
  }
}
