import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/text_widgets.dart';
import 'basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    _showDialogWhenCounterIsEqual3(ref, context);

    final value = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.bodyText(context, 'StateProvider'),
      ),
      body: Center(
        child: TextWidgets.headlineText(context, '$value'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // notifier property provides an instance of ths object (in this is "all State Provider")
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /*  A separate method for listening to changes and displaying a dialog
   */
  void _showDialogWhenCounterIsEqual3(WidgetRef ref, BuildContext context) {
    ref.listen<int>(
      counterProvider,
      (previous, next) {
        if (next == 3) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: TextWidgets.headlineText(context, 'counter: $next'),
            ),
          );
        }
      },
    );
  }
  //
}
