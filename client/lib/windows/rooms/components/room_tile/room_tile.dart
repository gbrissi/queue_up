import 'package:flutter/material.dart';
import 'package:queue_up/windows/rooms/components/room_tile/components/invite_user_btn.dart';
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

class RoomTile extends StatelessWidget {
  const RoomTile({super.key, required this.data});
  final RoomPreviewData data;

  @override
  Widget build(BuildContext context) {
    // Name, ID, Total Users
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Metadata
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      data.id,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "4 Users",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InviteUserBtn(),
              Row(
                children: List.generate(data.totalUsers, (i) {
                  return i != data.totalUsers - 1
                      ? Padding(
                        padding: EdgeInsets.all(8),
                        child: User(data: data.users[i]),
                      )
                      : User(data: data.users[i]);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
