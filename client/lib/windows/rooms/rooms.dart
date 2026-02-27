import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/windows_title_bar/windows_title_bar.dart';
import 'package:queue_up/windows/rooms/components/new_room/new_room_btn.dart';
import 'package:queue_up/windows/rooms/components/room_search_bar.dart';
import 'package:queue_up/windows/rooms/components/room_tile/room_tile.dart';

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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    children: [
                      RoomSearchBar(),
                      SizedBox(height: 12),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 2,
                          separatorBuilder: (_, __) => SizedBox(height: 12),
                          itemBuilder:
                              (_, __) => RoomTile(
                                data: RoomPreviewData(
                                  id: '120811241023',
                                  name: 'Customer Success',
                                  users: [
                                    UserCore(
                                      avatarUrl:
                                          'https://i.pravatar.cc/300?img=1',
                                      name: 'User 1',
                                      id: '123',
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      ),
                      SizedBox(height: 12),
                      NewRoomBtn(),
                    ],
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
