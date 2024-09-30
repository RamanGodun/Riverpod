import 'package:flutter/material.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

import '../data/helpers.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: OutlinedButton(
        onPressed: () => Helpers.pushTo(context, child),
        child: TextWidgets.buttonText(context, title),
      ),
    );
  }
}
