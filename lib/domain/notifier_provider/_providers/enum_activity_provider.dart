import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/models/activity.dart';
import 'dio_provider.dart';
import 'enum_activity_state.dart';

part 'enum_activity_provider.g.dart';

@riverpod
class MyCounter extends _$MyCounter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
}

@riverpod
class EnumActivity extends _$EnumActivity {
  int _errorCounter = 0;

  @override
  EnumActivityState build() {
    ref.onDispose(() {
      print('[enumActivityProvider] disposed');
    });
    ref.watch(myCounterProvider);
    print('hashCode: $hashCode');
    return EnumActivityState.initial();
  }

  Future<void> fetchActivity(String activityType) async {
    print('hashCode in fetchActivity: $hashCode');
    state = state.copyWith(status: ActivityStatus.loading);

    try {
      print('_errorCounter: $_errorCounter');
      if (_errorCounter++ % 2 != 1) {
        await Future.delayed(const Duration(milliseconds: 500));
        throw 'Fail to fetch activity';
      }

      final response = await ref.read(dioProvider).get('?type=$activityType');

      final List activityList = response.data;

      final activities = [
        for (final activity in activityList) Activity.fromJson(activity),
      ];

      state = state.copyWith(
        status: ActivityStatus.success,
        activities: activities,
      );
    } catch (e) {
      state = state.copyWith(
        status: ActivityStatus.failure,
        error: e.toString(),
      );
    }
  }
}
