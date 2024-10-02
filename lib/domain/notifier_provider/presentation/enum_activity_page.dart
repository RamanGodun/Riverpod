import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/activity.dart';
import '../_providers/enum_activity_provider.dart';
import '../_providers/enum_activity_state.dart';



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
    Future.delayed(Duration.zero, () {
      ref.read(enumActivityProvider.notifier).fetchActivity(activityTypes[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<EnumActivityState>(
      enumActivityProvider,
      (previous, next) {
        if (next.status == ActivityStatus.failure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(next.error),
              );
            },
          );
        }
      },
    );

    final activityState = ref.watch(enumActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('EnumActivityNotifier'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(myCounterProvider.notifier).increment();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              ref.invalidate(enumActivityProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: switch (activityState.status) {
        ActivityStatus.initial => const Center(
            child: Text(
              'Get some activity',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ActivityStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        ActivityStatus.failure =>
          activityState.activities.first == Activity.empty()
              ? Center(
                  child: Text(
                    activityState.error,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                )
              : ActivityWidget(activity: activityState.activities.first),
        ActivityStatus.success => ActivityWidget(
            activity: activityState.activities.first,
          ),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityTypes.length);
          ref
              .read(enumActivityProvider.notifier)
              .fetchActivity(activityTypes[randomNumber]);
        },
        label: Text(
          'New Activity',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  final Activity activity;
  const ActivityWidget({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        Text(
          activity.type,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        // BulletedList(
        //   bullet: const Icon(
        //     Icons.check,
        //     color: Colors.green,
        //   ),
        //   listItems: [
        //     'activity: ${activity.activity}',
        //     'availability: ${activity.availability}',
        //     'participants: ${activity.participants}',
        //     'price: ${activity.price}',
        //     'accessibility: ${activity.accessibility}',
        //     'duration: ${activity.duration}',
        //     'link: ${activity.link.isEmpty ? 'no link' : activity.link}',
        //     'kidFriendly: ${activity.kidFriendly}',
        //     'key: ${activity.key}',
        //   ],
        //   style: Theme.of(context).textTheme.titleLarge,
        // ),
      ],
    );
  }
}