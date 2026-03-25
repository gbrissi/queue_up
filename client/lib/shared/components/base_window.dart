import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/windows_title_bar/windows_title_bar.dart';
import 'package:queue_up/windows/rooms/rooms.dart';
import 'package:queue_up/windows/settings/settings.dart';

class BaseWindow extends StatelessWidget {
  const BaseWindow({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Material(
        elevation: 2,
        shadowColor: Colors.black,
        child: Scaffold(
          endDrawer: Drawer(
            child: Column(
              children: [
                TextButton.icon(
                  icon: Icon(Icons.room),
                  onPressed:
                      () => Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => const Rooms())),
                  label: Text("Rooms"),
                ),
                TextButton.icon(
                  icon: Icon(Icons.settings),
                  onPressed:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const Settings()),
                      ),
                  label: Text("Settings"),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              WindowsTitleBar(),
              Align(
                alignment: Alignment.topRight,
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(Icons.more_vert),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
