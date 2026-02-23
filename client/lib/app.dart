import 'package:flutter/material.dart';
import 'package:queue_up/services/window_service.dart';
import 'package:queue_up/shared/components/avatar_btn.dart';
import 'package:window_manager/window_manager.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WindowListener {
  final double dfltHeight = 71;
  double height = 0;
  // height must stay proportional to width / totalAvatars

  final int totalAvatars = 3;
  // final double avatarWidth = 70;
  // double get width => avatarWidth * totalAvatars;
  // get size => Size(width, dfltHeight);

  @override
  void initState() {
    super.initState();
    height = dfltHeight;
    windowManager.addListener(this);
    // WindowService.isWindowSet.addListener(() => _setWindowSize());
  }

  @override
  Future<void> onWindowResize() async {
    final size = await windowManager.getSize();
    height = (size.width * (1 / totalAvatars)) + 1;
    windowManager.setSize(Size(size.width, height));
    windowManager.setAlignment(Alignment.bottomRight);
    setState(() {});
  }

  void _setWindowSize() {
    final dfltSize = Size(dfltHeight - 1, dfltHeight);
    if (WindowService.isWindowSet.value) {
      windowManager.setSize(dfltSize);
      windowManager.setAlignment(Alignment.bottomRight);
    }
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    WindowService.isWindowSet.removeListener(() => _setWindowSize());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: List.generate(
            totalAvatars,
            (i) => Flexible(child: AvatarBtn()),
          ),
        ),
      ),
    );
  }
}
