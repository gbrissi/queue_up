import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/avatar_btn.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
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
          children: List.generate(
            5,
            (i) => Padding(
              padding: EdgeInsets.only(right: 12),
              child: const AvatarBtn(),
            ),
          ),
        ),
      ),
    );
  }
}
