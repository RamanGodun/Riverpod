import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/text_widgets.dart';
import '_auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    _showDialogWhenCounterIsEqual3(ref, context);

    // final value = ref.watch(counterProvider);
    final value = ref.watch(autoDisposedClickedTimesProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.bodyText(context, 'AutoDisposed StateProvider'),
      ),
      body: Center(
        child: TextWidgets.headlineText(
          context,
          value, //was '$value'
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(autoDisposedCounterProvider.notifier)
              .update((state) => state + 10);
          /* ALTERNATIVE SYNTAX
          ref.read(autoDisposedCounterProvider.notifier).state =
              ref.read(autoDisposedCounterProvider.notifier).state + 10;
          */
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /*  A separate method for listening to changes and displaying a dialog
   */
  void _showDialogWhenCounterIsEqual3(WidgetRef ref, BuildContext context) {
    ref.listen<int>(
      autoDisposedCounterProvider,
      (previous, next) {
        if (next == 70) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content:
                  TextWidgets.headlineText(context, 'U\'ve clicked: $next'),
            ),
          );
        }
      },
    );
  }
}
