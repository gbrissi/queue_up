import 'package:flutter/material.dart';

class RoomSearchBar extends StatelessWidget {
  const RoomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      child: TextField(
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search for a room',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
