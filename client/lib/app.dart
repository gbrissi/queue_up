import 'package:flutter/material.dart';
import 'package:queue_up/pages/home/home.dart';
import 'package:queue_up/shared/components/tray_widget.dart';
import 'package:queue_up/shared/components/windows_title_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: ElevatedButton(onPressed: () {}, child: Text("test")),
      ),
    );
  }
}
