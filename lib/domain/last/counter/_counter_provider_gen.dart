import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_counter_provider_gen.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build(int initialValue) {
    ref.onDispose(() {
      print('[counterProvider] disposed');
    });
    return initialValue;
  }

  void increment() {
    state++;
  }
}
