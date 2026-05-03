import 'package:flutter/material.dart';

// TODO: Create as a getter
class TxtStyle {
  static getHeadline(BuildContext ctx) => Theme.of(ctx).textTheme.headlineSmall!
      .copyWith(color: Theme.of(ctx).colorScheme.onSurface);

  static getTitle(BuildContext ctx) =>
      Theme.of(ctx).textTheme.titleMedium!.copyWith(
        color: Theme.of(ctx).colorScheme.onSurface,
        fontWeight: FontWeight.w400,
      );
}
