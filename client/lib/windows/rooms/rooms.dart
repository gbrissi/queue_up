import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/windows_title_bar/windows_title_bar.dart';

// Includes the rooms available to join
class Rooms extends StatelessWidget {
  const Rooms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Material(
          elevation: 2,
          shadowColor: Colors.black,
          child: Column(
            children: [
              WindowsTitleBar(),
              Expanded(child: Column(children: [Text("Test")])),
            ],
          ),
        ),
      ),
    );
  }
}
