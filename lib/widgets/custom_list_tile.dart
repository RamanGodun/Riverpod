import 'package:flutter/material.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

class AppListTile extends StatelessWidget {
  final Widget leading;
  final String title;

  const AppListTile({
    super.key,
    required this.leading,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: TextWidgets.titleMediumText(context, title),
    );
  }
}
