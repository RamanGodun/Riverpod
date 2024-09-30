import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_auto_dispose_provider.g.dart';

// StateProvider with autoDispose, meaning the provider will be disposed
// when no longer used or out of scope in the widget tree.
final autoDisposedCounterProvider = StateProvider.autoDispose<int>((ref) {
  // Callback triggered when the provider is disposed
  ref.onDispose(() {
    print('[autoDisposeCounterProvider] was disposed');
  });
  return 0; // Initial state value
});

@Riverpod(
    keepAlive: false) // Not keeping the provider alive after it's out of scope
String autoDisposedClickedTimes(AutoDisposedClickedTimesRef ref) {
  // Manually watching autoDisposedCounterProvider to get the current clicking count
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final clickingCount = ref.watch(autoDisposedCounterProvider);

  // Callback triggered when the provider is disposed
  ref.onDispose(() => print('[autoDisposedClickedTimesProvider] was disposed'));

  return "$clickingCount"; // Return the current click count as a string
}
