import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';

import '../../../data/enums.dart';
import '../../../data/models/activity.dart';
import '../../../data/models/enum_based_async_activity_state.dart';
import '../../../widgets/error_dialog.dart';
import '../../../widgets/text_widget.dart';
import '../../../widgets/activity_widget.dart';
import 'enum_async_activity_provider.dart';

class EnumAsyncActivityPage extends ConsumerWidget {
  const EnumAsyncActivityPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listening to changes in the EnumActivityState provider.
    // If the status transitions to 'failure', an error dialog is displayed.
    listenForFailures(context, ref);

    // Watching the current state of the provider.
    final asyncActivityState = ref.watch(enumAsyncActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title:
            const TextWidget('EnumAsyncActivityNotifier', TextType.titleMedium),
        actions: [
          IconButton(
            onPressed: () => ref.read(myCounterProvider.notifier).increment(),
            icon: const Icon(Icons.add),
          ),
          // Button to refresh the enumActivityProvider and reset its state.
          IconButton(
            onPressed: () => ref.invalidate(enumAsyncActivityProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      // Different UI is rendered based on the current state of the provider.
      body: switch (asyncActivityState.status) {
        // Initial state, encouraging the user to fetch an activity.
        ActivityStatus.initial => const Center(
            child: TextWidget('Get some activity', TextType.titleMedium)),
        // Loading state, displaying a loading widget.
        ActivityStatus.loading => const AppMiniWidgets(MWType.loading),
        // Failure state, displaying an error widget or a fallback activity.
        //  when no available previous data => error widget
        // ! when failure happens, then available previous data are shown (good pattern)
        ActivityStatus.failure =>
          asyncActivityState.activities.first == Activity.empty()
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppMiniWidgets(MWType.error,
                      error: asyncActivityState.error))
              : ActivityWidget(activity: asyncActivityState.activities.first),
        // Success state, displaying the fetched activity.
        ActivityStatus.success =>
          ActivityWidget(activity: asyncActivityState.activities.first),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Randomly selects an activity type and fetches a new activity.
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumAsyncActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

/* Methods next
Method to listen for any failures in the EnumActivityState provider and display an error dialog.
 */
  void listenForFailures(BuildContext context, WidgetRef ref) {
    ref.listen<EnumAsyncActivityState>(
      enumAsyncActivityProvider,
      (previous, next) {
        if (next.status == ActivityStatus.failure && context.mounted) {
          ErrorDialog.show(context, next.error);
        }
      },
    );
  }

  //
}
