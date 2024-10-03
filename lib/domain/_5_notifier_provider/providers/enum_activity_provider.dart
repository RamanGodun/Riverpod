import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/models/activity.dart';
import '../../../data/models/enum_activity_state.dart';
import 'dio_provider.dart';


part 'enum_activity_provider.g.dart';

@riverpod
class EnumActivity extends _$EnumActivity {
  // Tracks how many times an error has occurred.
  // Used to simulate a 50% failure rate by incrementing this counter
  // and checking if the number is even or odd.
  int _errorCounter = 0;

  @override
  EnumActivityState build() {
    // This method is called when the provider is disposed (no longer in use).
    // Useful for cleaning up resources or performing final logging.
    ref.onDispose(() {
      print('[enumActivityProvider] disposed');
    });

    // Watching another provider (in this case, MyCounter) inside the state builder.
    // This triggers a rebuild when the watched provider's state changes.
    ref.watch(myCounterProvider);

    print('hashCode: $hashCode'); // Debugging purposes to track state changes.
    return EnumActivityState
        .initial(); // Return the initial state of the provider.
  }

  // Fetches activities based on the given activity type from the API.
  // It simulates a network call where every second call fails to test error handling.
  Future<void> fetchActivity(String activityType) async {
    print(
        'hashCode in fetchActivity: $hashCode'); // Debugging to track function calls.

    // Setting the state to loading before the request.
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      print('_errorCounter: $_errorCounter');
      // Simulate an error for 50% of requests by checking the counter.
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(
            const Duration(milliseconds: 500)); // Simulate network delay.
        throw 'Fail to fetch activity'; // Throwing an error to simulate failure.
      }

      // Perform the API request to fetch activities by type.
      final response = await ref.read(dioProvider).get('?type=$activityType');
      print(
          'Status code: ${response.statusCode}'); // For debugging response status.
      print('Response body: ${response.data}'); // For debugging response body.

      // Convert the response into a list of Activity objects.
      final List activityList = response.data;

      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

      // Update the state to success and populate it with fetched activities.
      state = state.copyWith(
        status: ActivityStatus.success,
        activities: activities,
      );
    } catch (e) {
      // If any error occurs, update the state to failure and pass the error message.
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}

/*
MyCounter provider handles a simple integer state.
It increments a counter which is observed by EnumActivity to trigger side effects.
 */
@riverpod
class MyCounter extends _$MyCounter {
  @override
  int build() {
    return 0; // Initializes the counter at 0.
  }

  // Method to increment the counter.
  // Whenever this is called, the state changes and any listeners are notified.
  void increment() => state++;
}
