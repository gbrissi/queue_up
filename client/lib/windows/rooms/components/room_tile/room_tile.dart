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
                          data.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          data.id,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      InviteUserBtn(),
                      Positioned(
                        top: -6,
                        left: -8,
                        right: -8,
                        child: Center(
                          child: IgnorePointer(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.inverseSurface,
                              ),
                              padding: EdgeInsets.all(1),
                              child: Text(
                                "${data.totalUsers} user(s)",
                                style: TextStyle(
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onInverseSurface,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    itemCount: data.users.length + 1,
                    itemBuilder: (context, index) {
                      if (index != data.users.length) {
                        return User(data: data.users[index]);
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
