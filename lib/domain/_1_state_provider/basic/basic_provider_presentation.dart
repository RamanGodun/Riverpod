import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';

import '../../../widgets/text_widget.dart';
import '_basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Call the method that listens for changes and shows a dialog if the counter equals 3
    _showDialogWhenCounterIsEqual3(ref, context);

    // Watch the value of clickedTimesProvider to rebuild the UI on state changes
    final value = ref.watch(clickedTimesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('StateProvider', TextType.body),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWidget('You\'ve already clicked', TextType.headline),
            TextWidget('$value times', TextType.headline)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Increment the state of counterProvider using its Notifier
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /*
   * Listens to the counterProvider and shows a dialog when the counter reaches 3
   * This approach prevents rebuilding the widget tree unnecessarily.
   */
  void _showDialogWhenCounterIsEqual3(WidgetRef ref, BuildContext context) {
    ref.listen<int>(
      counterProvider,
      (previous, next) {
        if (next == 3) {
          // Show a dialog when the counter value reaches 3
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Center(
                  child: AppMiniWidgets(
                MWType.error,
                error: 'WARNING: $next times!',
              )),
            ),
          );
        }
      },
    );
  }
}
