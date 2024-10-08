import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../data/models/activity.dart';
import '../../_5_notifier_provider/providers/dio_provider.dart';

part 'async_activity_provider.g.dart';

@riverpod
class AsyncActivity extends _$AsyncActivity {
  int _errorCounter = 0;

  /// Initializes the provider and fetches the default activity.
  @override
  FutureOr<Activity> build() {
    ref.onDispose(() {
      print('[asyncActivityProvider] disposed');
    });
    // Initial fetch for the default activity type.
    return getActivity(activityTypes[0]);
  }

  /// Fetches activity data based on the given activity type and updates the state.
  Future<void> fetchActivity(String activityType) async {
    state = const AsyncValue.loading();
    // Use AsyncValue.guard to safely handle errors during the fetch.
    state = await AsyncValue.guard(() async {
      return getActivity(activityType);
    });
  }

  /// Makes a network request to fetch the activity data based on the given type.
  Future<Activity> getActivity(String activityType) async {
    // Simulate errors for testing purposes before making the actual request.
    await errorImitationMethod();
    // Fetch the activity from the server using dioProvider.
    final response = await ref.read(dioProvider).get('?type=$activityType');
    // Convert the response to a list and return the first activity.
    final List activityList = response.data;
    return Activity.fromJson(activityList[0]);
  }

  /// Simulates an error for testing error handling. Every second call throws an error.
  Future<void> errorImitationMethod() async {
    if (_errorCounter++ % 2 != 1) {
      // Simulate network delay and throw an error for 50% of the requests.
      await Future.delayed(const Duration(seconds: 1));
      throw 'Fail to fetch activity';
    }
  }
}
