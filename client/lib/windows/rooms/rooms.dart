import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/base_window.dart';
import 'package:queue_up/windows/rooms/components/new_room/new_room_btn.dart';
import 'package:queue_up/windows/rooms/components/room_search_bar.dart';
import 'package:queue_up/windows/rooms/components/room_tile/room_tile.dart';

// Includes the rooms available to join
class Rooms extends StatelessWidget {
  const Rooms({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      enableScroll: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rooms",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 24),
          RoomSearchBar(),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: 2 + 1,
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemBuilder: (_, i) {
                if (i != 2) {
                  return RoomTile(
                    data: RoomPreviewData(
                      id: '120811241023',
                      name: 'Customer Success',
                      users: [
                        UserCore(
                          avatarUrl: 'https://i.pravatar.cc/300?img=1',
                          name: 'User 1',
                          id: '123',
                        ),
                      ],
                    ),
                  );
                } else {
                  return const NewRoomBtn();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
