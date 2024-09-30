import 'package:flutter/material.dart';
import 'package:riverpod_project/data/helpers.dart';

class TextWidgets {
  //
  static Widget headlineText(BuildContext context, String title) {
    return Text(title, style: Helpers.getTextTheme(context).headlineMedium);
  }

  //
  static Widget bodyText(BuildContext context, String title) {
    return Text(title, style: Helpers.getTextTheme(context).bodyMedium);
  }

  static Widget buttonText(BuildContext context, String title) {
    return Text(title,
        style: Helpers.getTextTheme(context)
            .titleMedium
            ?.copyWith(color: Helpers.getColorScheme(context).secondary));
  }
  /*
   */
}
