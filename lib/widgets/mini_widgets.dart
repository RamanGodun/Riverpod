import 'package:flutter/material.dart';

import 'text_widget.dart';

// Enum to define different types of mini widgets
enum MWType {
  loading,
  error,
}

class AppMiniWidgets extends StatelessWidget {
  final MWType type;
  final Object? error;
  final StackTrace? stackTrace;

  const AppMiniWidgets(
    this.type, {
    super.key,
    this.error,
    this.stackTrace,
  });
  @override
  Widget build(BuildContext context) {
    switch (type) {
      case MWType.loading:
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      case MWType.error:
        //! it's necessary to handle StackTrace st value (if it available)
        return Center(
          child: TextWidget(
            error?.toString() ?? 'An unknown error occurred',
            TextType.error,
          ),
        );
      default:
        return const SizedBox
            .shrink(); // Return an empty widget for unsupported types
    }
  }
}
