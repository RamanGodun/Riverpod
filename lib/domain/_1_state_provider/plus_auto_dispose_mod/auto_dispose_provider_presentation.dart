import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/app_constants.dart';
import '../../../widgets/text_widgets.dart';
import '_auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listening for changes and displaying a dialog when the counter reaches a specific value
    _showDialogWhenCounterIsEqual7(ref, context);

    // Watch the value from autoDisposedClickedTimesProvider, which will rebuild the UI when the state changes
    final value = ref.watch(autoDisposedClickedTimesProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.bodyText(context, 'AutoDisposed StateProvider'),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidgets.headlineText(
              context,
              "You've already clicked ",
            ),
            TextWidgets.headlineText(
              context,
              '$value times',
              color: AppConstants.errorColor,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Increment the state using the update method for cleaner state management
          ref
              .read(autoDisposedCounterProvider.notifier)
              .update((state) => state + 1);

          /* ALTERNATIVE SYNTAX: Directly setting the state value (less clean but possible)
          ref.read(autoDisposedCounterProvider.notifier).state =
              ref.read(autoDisposedCounterProvider.notifier).state + 10;
          */
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /*
   * Listens to autoDisposedCounterProvider and shows a dialog
   * when the counter reaches 7. This avoids unnecessary rebuilds.
   */
  void _showDialogWhenCounterIsEqual7(WidgetRef ref, BuildContext context) {
    ref.listen<int>(
      autoDisposedCounterProvider,
      (previous, next) {
        if (next == 7) {
          // Show a dialog when the counter reaches 7
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Center(
                child: TextWidgets.headlineText(
                  context,
                  'DANGER: $next times!',
                  color: AppConstants.errorColor,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
