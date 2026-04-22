import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/providers/theme_provider.dart';
import 'package:queue_up/windows/new_room/new_room.dart';
import 'package:queue_up/windows/settings/settings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Builder(
        builder: (_) {
          return Consumer<ThemeProvider>(
            builder: (_, p, __) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: NewRoom(),
                theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: p.seedColor,
                    brightness: p.brightness,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
