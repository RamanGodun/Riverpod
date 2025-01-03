import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_5_async_notifier.g.dart';

@riverpod
class CounterAsyncNotifier extends _$CounterAsyncNotifier {
  int _counter = 0;

  @override
  FutureOr<int> build() {
    return _generateInt(_counter);
  }

  Future<int> _generateInt(int counter) async {
    await Future.delayed(const Duration(seconds: 1));
    return counter;
  }

  Future<void> increment() async {
    state = const AsyncLoading<int>();

    state = await AsyncValue.guard(() => _generateInt(++_counter));
  }
}
