import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queue_up/shared/providers/theme_provider.dart';

class ColorOption extends StatelessWidget {
  final Color color;
  const ColorOption({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder:
          (_, p, __) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color:
                    p.seedColor == color
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Material(
                color: color,
                borderRadius: BorderRadius.circular(999),
                child: InkWell(
                  onTap: () => p.setSeedColor(color),
                  child: SizedBox(height: 24, width: 24),
                ),
              ),
            ),
          ),
    );
  }
}
