import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends AutoDisposeFamilyNotifier<int, int> {
  @override
  int build(int arg) {
    ref.onDispose(() {
      print('[counterProvider] disposed');
    });
    return arg;
  }

  void increment() {
    state++;
  }
}

final counterProvider =
    NotifierProvider.autoDispose.family<Counter, int, int>(Counter.new);
