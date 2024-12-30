import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';
import '../../../data/models/activity.dart';
import '../../../widgets/text_widget.dart';
import '../providers/sealed_class_based_state/sealed_activity_provider.dart';
import '../providers/sealed_class_based_state/sealed_activity_state.dart';
import '../../../widgets/activity_widget.dart';

// The main page that manages and displays the state of SealedActivityNotifier.
class SealedActivityPage extends ConsumerStatefulWidget {
  const SealedActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedActivityPageState();
}

class _SealedActivityPageState extends ConsumerState<SealedActivityPage> {
  // Caches the last successfully built widget.
  // ! In case of a failure, this cached widget is displayed to the user instead of an error message.
  Widget? prevWidget;

  @override
  void initState() {
    super.initState();
    // We use Future.delayed with Duration.zero to ensure that the provider's fetchActivity method
    //*  is called after the widget tree has been built. This avoids state modification during build.
    Future.delayed(Duration.zero, () {
      ref.read(sealedActivityProvider.notifier).fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen for changes in the provider's state and show an error dialog if needed.
    showErrorDialog(context);
    // Watch the current state of the sealedActivityProvider.
    final activityState = ref.watch(sealedActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('SealedActivityNotifier', TextType.titleSmall),
        actions: [
          // Refresh button that invalidates the current state and forces a reload.
          IconButton(
            onPressed: () => ref.invalidate(sealedActivityProvider),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      // Render the UI based on the current state using the `when` method.
      //* This ensures that the appropriate widget is shown for each state.
      body: activityState.when(
        initial: () => const Center(
          child: TextWidget('Get some activity', TextType.titleMedium),
        ),
        loading: () => const AppMiniWidgets(MWType.loading),
        failure: (error) => prevWidget == null
            ? const Center(
                child: TextWidget('Get some activity', TextType.error),
              )
            : prevWidget!,
        //* Cache the success widget so that it can be displayed in case of future failures.
        success: (List<Activity> activities) => prevWidget = ActivityWidget(
          activity: activities.first,
        ),
      ),
      /*
        * Alternative syntax: The `switch` statement is another way to handle states.
        * This syntax works similarly to `when` but might be preferable in certain scenarios
        * where more flexibility or readability is needed for large blocks of logic.
       */
      // body: switch (activityState) {
      //   SealedActivityInitial() => Center(
      //       child: TextWidgets.titleMediumText(context, 'Get some activity')),
      //   SealedActivityLoading() => AppMiniWidgets.loadingWidget(),
      //   SealedActivityFailure() => prevWidget == null
      //       ? Center(child: TextWidgets.errorText(context, 'Get some activity'))
      //       : prevWidget!,
      //   SealedActivitySuccess(activities: List<Activity> activities) =>
      //     prevWidget = ActivityWidget(
      //       activity: activities.first,
      //     ),
      // },
      floatingActionButton: FloatingActionButton.extended(
        // Fetch a new random activity when the button is pressed.
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(sealedActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

  /* Methods
     */
  // This method listens for changes in the SealedActivityState and shows an error dialog
  // if the state transitions to a failure. For other states, no action is taken.
  void showErrorDialog(BuildContext context) {
    ref.listen<SealedActivityState>(
      sealedActivityProvider,
      (previous, next) {
        switch (next) {
          // If the state is SealedActivityFailure, show an error dialog with the error message.
          case SealedActivityFailure(error: String error):
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: AppMiniWidgets(MWType.error, error: error),
                );
              },
            );
          /*
              * Not to show dialog for all other cases, used next: */
          case _:
          // No action is needed for other states.
        }
      },
    );
  }

  /*
        * When need dialog for a few states, use next:

    void showErrorDialog(BuildContext context) {
    ref.listen<SealedActivityState>(
      sealedActivityProvider,
      (previous, next) {
        // Use `when` to handle multiple states and show a dialog for specific ones like `failure`.
        next.when(
          initial: () {
            //  No action needed for the initial state
          },
          loading: () {
            //  No action needed for the loading state
          },
          success: (activities) {
            //  No action needed for the success state
          },
          failure: (error) {
            // Show error dialog when failure occurs
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: TextWidgets.errorText(context, error),
                );
              },
            );
          },
        );
      },
    );
  }
  */
}
