import 'package:flutter/material.dart';
import 'package:riverpod_project/data/helpers.dart';

import '../data/app_constants.dart';

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

  static Widget smallHeadlineText(BuildContext context, String title,
      {Color? color}) {
    final theme = Helpers.getTheme(context);
    return Text(
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineSmall?.copyWith(
        color: color ?? theme.colorScheme.primary,
      ),
      title,
    );
  }

  static Widget titleSmallText(BuildContext context, String title,
      {Color? color}) {
    final theme = Helpers.getTheme(context);
    return Text(
      textAlign: TextAlign.center,
      style: theme.textTheme.titleSmall?.copyWith(
        color: color ?? theme.colorScheme.primary,
      ),
      title,
    );
  }

  static Widget titleMediumText(BuildContext context, String title,
      {Color? color}) {
    final theme = Helpers.getTheme(context);
    return Text(
      textAlign: TextAlign.center,
      style: theme.textTheme.titleMedium?.copyWith(
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

  static Widget errorText(BuildContext context, String e) {
    final textTheme = Helpers.getTextTheme(context).bodyLarge;
    return Text(
      e.toString(),
      style: textTheme?.copyWith(color: AppConstants.errorColor),
    );
  }
  /*
   */
}
