import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/activity.dart';

part 'enum_activity_state.freezed.dart';

/*
This enum represents the possible states that the Activity fetching process can be in.
It allows tracking whether the app is idle, loading data, has successfully loaded data,
or encountered a failure. This pattern provides a clean way to manage state transitions.
 */
enum ActivityStatus {
  initial,  // The initial state before any data is fetched.
  loading,  // State when the data is being fetched.
  success,  // State when the data is successfully retrieved.
  failure,  // State when the data fetching fails.
}

@freezed
class EnumActivityState with _$EnumActivityState {
  // This factory defines the structure of the activity state.
  // It holds the current status of the activity (based on ActivityStatus enum),
  // a list of activities (fetched or empty), and a potential error message.
  const factory EnumActivityState({
    required ActivityStatus status,     // Tracks the current status of the data fetching.
    required List<Activity> activities, // List of fetched activities.
    required String error,              // Stores the error message in case of failure.
  }) = _EnumActivityState;

  // A convenient factory constructor to create the initial state.
  // It sets the status to 'initial', provides an empty list of activities,
  // and ensures no error is present at the start.
  factory EnumActivityState.initial() {
    return EnumActivityState(
      status: ActivityStatus.initial,   // Initial status.
      activities: [Activity.empty()],   // Empty list at the start.
      error: '',                        // No error initially.
    );
  }
}
