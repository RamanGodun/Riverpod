import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/activity.dart';

part 'enum_activity_state.freezed.dart';

/*
This is within "Enum state shape", when all possible states are in one class
 */
enum ActivityStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class EnumActivityState with _$EnumActivityState {
  const factory EnumActivityState({
    required ActivityStatus status,
    required List<Activity> activities,
    required String error,
  }) = _EnumActivityState;

  factory EnumActivityState.initial() {
    return EnumActivityState(
      status: ActivityStatus.initial,
      activities: [Activity.empty()],
      error: '',
    );
  }
}
