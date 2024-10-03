import 'dart:math';

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

import '../../../data/models/activity.dart';
import '../../../data/models/enum_activity_state.dart';
import '../../../widgets/error_dialog.dart';
import '../providers/enum_activity_provider.dart';

// StatefulWidget is used here to handle widget lifecycle and state changes
// when interacting with Riverpod providers.
class EnumActivityPage extends ConsumerStatefulWidget {
  const EnumActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnumActivityPageState();
}

class _EnumActivityPageState extends ConsumerState<EnumActivityPage> {
  @override
  void initState() {
    super.initState();
    //! The fetch method must be asynchronous (Future), otherwise,
    //! the widget lifecycle will be invalid.
    //! Changing a provider during the build phase could cause unwanted behaviors,
    //! so it's delayed until after the widget tree is built.
    Future.delayed(
        Duration.zero,
        () => ref
            .read(enumActivityProvider.notifier)
            .fetchActivity(activityTypes[0]));
  }

  @override
  Widget build(BuildContext context) {
    // Listening to changes in the EnumActivityState provider.
    // If the status transitions to 'failure', an error dialog is displayed.
    listenForFailures(context);

    // Watching the current state of the provider.
    final activityState = ref.watch(enumActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EnumActivityNotifier'),
        actions: [
          // Button to increment the counter via MyCounter provider.
          // Useful for testing provider interaction.
          IconButton(
            onPressed: () => ref.read(myCounterProvider.notifier).increment(),
            icon: const Icon(Icons.add),
          ),
          // Button to refresh the enumActivityProvider and reset its state.
          IconButton(
            onPressed: () => ref.invalidate(enumActivityProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      // Different UI is rendered based on the current state of the provider.
      body: switch (activityState.status) {
        // Initial state, encouraging the user to fetch an activity.
        ActivityStatus.initial => Center(
            child: TextWidgets.titleMediumText(context, 'Get some activity')),
        // Loading state, displaying a loading widget.
        ActivityStatus.loading => AppMiniWidgets.loadingWidget(),
        // Failure state, displaying an error widget or a fallback activity.
        ActivityStatus.failure =>
          activityState.activities.first == Activity.empty()
              ? AppMiniWidgets.errorWidget(context, activityState.error)
              : ActivityWidget(activity: activityState.activities.first),
        // Success state, displaying the fetched activity.
        ActivityStatus.success =>
          ActivityWidget(activity: activityState.activities.first),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Randomly selects an activity type and fetches a new activity.
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: TextWidgets.titleMediumText(context, 'New Activity'),
      ),
    );
  }

/* Methods next
 */
// Method to listen for any failures in the EnumActivityState provider and display an error dialog.
  void listenForFailures(BuildContext context) {
    ref.listen<EnumActivityState>(
      enumActivityProvider,
      (previous, next) {
        if (next.status == ActivityStatus.failure && context.mounted) {
          ErrorDialog.show(context, next.error);
        }
      },
    );
  }

  //
}

// Widget to display the details of a single activity.
// This widget formats and presents the activity data in a bulleted list.
class ActivityWidget extends StatelessWidget {
  final Activity activity;

  const ActivityWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        // Display the type of the activity in a headline style.
        TextWidgets.headlineText(context, activity.type),
        const Divider(),
        // Display detailed information about the activity using a bulleted list.
        BulletedList(
          bullet: const Icon(
            Icons.check,
            color: Colors.green,
          ),
          listItems: [
            'activity: ${activity.activity}',
            'availability: ${activity.availability}',
            'participants: ${activity.participants}',
            'price: ${activity.price}',
            'accessibility: ${activity.accessibility}',
            'duration: ${activity.duration}',
            'link: ${activity.link.isEmpty ? 'no link' : activity.link}',
            'kidFriendly: ${activity.kidFriendly}',
            'key: ${activity.key}',
          ],
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
