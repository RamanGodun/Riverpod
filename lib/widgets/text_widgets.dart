import 'package:flutter/material.dart';
import 'package:riverpod_project/data/helpers.dart';

class TextWidgets {
  //
  static Widget headlineText(BuildContext context, String title,
      {Color? color}) {
    final theme = Helpers.getTheme(context);
    return Text(
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineMedium?.copyWith(
        color: color ?? theme.colorScheme.primary,
      ),
      title,
    );
  }

  //
  static Widget bodyText(BuildContext context, String title) {
    return Text(
      style: Helpers.getTextTheme(context).bodyMedium,
      title,
    );
  }

  static Widget buttonText(BuildContext context, String title) {
    return Text(
      style: Helpers.getTextTheme(context)
          .titleMedium
          ?.copyWith(color: Helpers.getColorScheme(context).secondary),
      title,
    );
  }
  /*
   */
}
