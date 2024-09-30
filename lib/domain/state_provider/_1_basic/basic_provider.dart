import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// rivp => autocompletion
part 'basic_provider.g.dart';

final counterProvider = StateProvider<int>((ref) {
  ref.onDispose(() {
    print('[counterProvider] disposed');
  });
  return 0;
});

@Riverpod(keepAlive: true)
String clickedTimes(ClickedTimesRef ref) {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final clickingCount = ref.watch(counterProvider);
  // !! every time as state of counterProvider CHANGES => clickedTimesProvider ("keepAlive: true") was disposed
  // ! it rebuilds every time
  ref.onDispose(() => print('[clickedTimesProvider] was disposed'));
  return "U've already clicked $clickingCount times";
}
