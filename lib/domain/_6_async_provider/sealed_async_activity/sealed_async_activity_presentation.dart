import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';
import '../../../data/models/activity.dart';
import '../../../widgets/text_widget.dart';
import '../../../widgets/activity_widget.dart';
import '_sealed_async_activity_provider.dart';
import '_sealed_async_activity_state.dart';

class SealedAsyncActivityPage extends ConsumerStatefulWidget {
  const SealedAsyncActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedAsyncActivityPageState();
}

class _SealedAsyncActivityPageState
    extends ConsumerState<SealedAsyncActivityPage> {
  Widget? prevWidget;

  @override
  Widget build(BuildContext context) {
    showDialogWhenErrorsOccurs(context);

    final activityState = ref.watch(sealedAsyncActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'SealedAsyncActivityNotifier',
          TextType.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(sealedAsyncActivityProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: activityState.when(
        // Loading state, displaying a loading widget.
        loading: () => const AppMiniWidgets(MWType.loading),

        // Failure state, displaying an error widget or fallback activity.
        failure: (error) => prevWidget == null
            ? const AppMiniWidgets(MWType.error, error: 'Get some activity')
            : prevWidget!,

        // Success state, displaying the fetched activity.
        success: (activities) => prevWidget = ActivityWidget(
          activity: activities.first,
        ),
      ),
      // * Alternative syntax
      // body: switch (activityState) {
      //   SealedAsyncActivityLoading() => AppMiniWidgets.loadingWidget(),
      //   SealedAsyncActivityFailure() => prevWidget == null
      //       ? AppMiniWidgets.errorWidget(context, 'Get some activity')
      //       : prevWidget!,
      //   SealedAsyncActivitySuccess(activities: List<Activity> activities) =>
      //     prevWidget = ActivityWidget(
      //       activity: activities.first,
      //     ),
      // },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(sealedAsyncActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: const TextWidget('New Activity', TextType.titleMedium),
      ),
    );
  }

  // * METHODS
  void showDialogWhenErrorsOccurs(BuildContext context) {
    ref.listen<SealedAsyncActivityState>(
      sealedAsyncActivityProvider,
      (previous, next) {
        switch (next) {
          case SealedAsyncActivityFailure(error: String error):
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: AppMiniWidgets(MWType.error, error: error),
                );
              },
            );
          case _:
        }
      },
    );
  }
}
