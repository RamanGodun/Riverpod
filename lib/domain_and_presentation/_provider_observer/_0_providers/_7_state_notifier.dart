import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  void increment() => state++;
}

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, int>((ref) {
  return CounterStateNotifier();
});
