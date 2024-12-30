import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_basic_provider.g.dart';

// StateProvider for managing integer state (counter)
final counterProvider = StateProvider<int>((ref) {
  // Callback triggered when the provider is disposed
  ref.onDispose(() {
    print('[counterProvider] disposed');
  });
  return 0; // Initial state value
});

@Riverpod(keepAlive: true)
String clickedTimes(Ref ref) {
  // Manually watching counterProvider to get the current clicking count
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final clickingCount = ref.watch(counterProvider);

  // Comment: Every time the state of counterProvider changes,
  // clickedTimesProvider (marked as "keepAlive: true") is disposed and recreated.
  // This will cause the provider to rebuild every time the counter changes.

  // Callback triggered when the provider is disposed
  ref.onDispose(() => print('[clickedTimesProvider] was disposed'));

  return " $clickingCount";
}
