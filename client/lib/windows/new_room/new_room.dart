import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/base_window.dart';

class NewRoom extends StatelessWidget {
  const NewRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return BaseWindow(
      showBackButton: true,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Room',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: scheme.onSurface),
            ),
            SizedBox(height: 4),
            // Subtitle
            Text(
              'Create a new room to start a new conversation!',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            SizedBox(height: 24),
            // Form
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.group),
                      label: Text('Room Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.description),
                      label: Text('Room description'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Users",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      // TODO:
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: scheme.surfaceContainer,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [CircleAvatar()],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: scheme.primary,
                        backgroundColor: scheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
