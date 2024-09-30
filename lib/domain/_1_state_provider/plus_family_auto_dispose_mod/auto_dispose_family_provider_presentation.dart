import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/text_widgets.dart';
import '_auto_dispose_family_provider.dart';
import '../../../data/app_constants.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listening to changes and showing a dialog when the counter reaches dangerous values
    _showDialogWhenCounterEquals(ref, context, 70);
    _showDialogWhenCounterEquals(ref, context, -70);

    // Values for incrementing and decrementing
    final valueForIncrementing = 10;
    final valueForDecrementing = -10;

    // Watching familyAutoDisposedCounterProvider with different values
    final valueIncrementation =
        ref.watch(familyAutoDisposedCounterProvider(valueForIncrementing));
    final valueDecrementation =
        ref.watch(familyAutoDisposedCounterProvider(valueForDecrementing));

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.bodyText(context, 'AutoDispose FamilyStateProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidgets.buttonText(
              context,
              'Current value1 is: $valueIncrementation',
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              child: TextWidgets.buttonText(context, 'Increment (+10)'),
              onPressed: () {
                // Increment the state by 10 using familyAutoDisposedCounterProvider
                ref
                    .read(
                        familyAutoDisposedCounterProvider(valueForIncrementing)
                            .notifier)
                    .update((state) => state + valueForIncrementing);
              },
            ),
            const SizedBox(height: 120),
            TextWidgets.buttonText(
              context,
              'Current value2 is: $valueDecrementation',
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              child: TextWidgets.buttonText(context, 'Decrement (-10)'),
              onPressed: () {
                // Decrement the state by 10 using familyAutoDisposedCounterProvider
                ref
                    .read(
                        familyAutoDisposedCounterProvider(valueForDecrementing)
                            .notifier)
                    .update((state) => state + valueForDecrementing);
              },
            ),
          ],
        ),
      ),
    );
  }

  /*
   * General method to listen for changes in familyAutoDisposedCounterProvider
   * and show a dialog when the counter reaches a specified value.
   */
  void _showDialogWhenCounterEquals(
      WidgetRef ref, BuildContext context, int targetValue) {
    // Listening to the familyAutoDisposedCounterProvider with the given target value
    ref.listen<int>(
      familyAutoDisposedCounterProvider(targetValue.isNegative ? -10 : 10),
      (previous, next) {
        if (next == targetValue) {
          // Show a dialog when the counter reaches the specified value
          showDialog(
            context: context,
            builder: (context) => Center(
              child: AlertDialog(
                content: Align(
                  alignment: Alignment.center,
                  child: TextWidgets.headlineText(
                    context,
                    'Number $next is dangerous!',
                    color: AppConstants.errorColor,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
