import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/components/dialog/dialog_provider.dart';
import 'package:queue_up/windows/rooms/components/room_tile/components/user.dart';

class UserCore {
  final String id;
  final String name;
  final String avatarUrl;

  UserCore({required this.id, required this.name, required this.avatarUrl});
}

class RoomPreviewData {
  final String id;
  final String name;
  final List<UserCore> users;
  int get totalUsers => users.length;

  RoomPreviewData({required this.id, required this.name, required this.users});
}

class RoomTile extends StatefulWidget {
  const RoomTile({super.key, required this.data});
  final RoomPreviewData data;

  @override
  State<RoomTile> createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomTile> {
  @override
  Widget build(BuildContext context) {
    // Name, ID, Total Users
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            children: [
              // Metadata
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.data.id,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // TODO: Create a horizontal ListView
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child: SizedBox(
                  height: 52,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: widget.data.users.length + 1,
                    itemBuilder: (context, index) {
                      if (index != widget.data.users.length) {
                        return User(data: widget.data.users[index]);
                      }

                      // Add more button
                      return ClipOval(
                        child: Material(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withValues(alpha: 0.4),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.add,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
