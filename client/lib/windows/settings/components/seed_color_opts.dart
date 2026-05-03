import 'package:flutter/material.dart';
import 'package:queue_up/windows/settings/components/add_color_btn.dart';
import 'package:queue_up/windows/settings/components/color_option.dart';
import 'package:queue_up/windows/settings/providers/color_options_provider.dart';

class SeedColorOpts extends StatelessWidget {
  const SeedColorOpts({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(4),
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Wrap(
          spacing: 2,
          runSpacing: 2,
          children: [
            ...List.generate(
              defaultColors.length,
              (i) => ColorOption(color: defaultColors[i]),
            ),
            AddColorBtn(),
          ],
        ),
      ),
    );
  }
}
