import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// rivp => autocompletion
part '_auto_dispose_provider.g.dart';

final autoDisposedCounterProvider = StateProvider.autoDispose<int>((ref) {
  ref.onDispose(() {
    print('[autoDisposeCounterProvider] was disposed');
  });
  return 0;
});

@Riverpod(keepAlive: false)
String autoDisposedClickedTimes(AutoDisposedClickedTimesRef ref) {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final clickingCount = ref.watch(autoDisposedCounterProvider);
  ref.onDispose(() => print('[autoDisposedClickedTimesProvider] was disposed'));
  return "U've already clicked $clickingCount times";
}
