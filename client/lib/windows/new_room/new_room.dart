import 'package:flutter/material.dart';
import 'package:queue_up/shared/components/base_window.dart';

class NewRoom extends StatelessWidget {
  const NewRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWindow(
      showBackButton: true,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Room',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
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
                spacing: 12,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.group),
                      label: Text('Room Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      label: Text('Room description'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
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
