import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/windows_title_bar.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            WindowsTitleBar(),
            Expanded(child: Center(child: Text('Hello World!'))),
          ],
        ),
      ),
    );
  }
}
