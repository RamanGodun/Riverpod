import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
The state of AutoDisposeFamilyNotifier have to be initialized SYNCHRONOUSLY
(if it's initialized ASYNCHRONOUSLY -- then use ASYNC NOTIFIER)
 */
class CounterOnNotifier extends AutoDisposeFamilyNotifier<int, int> {
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

final counterProvider = NotifierProvider.autoDispose
    .family<CounterOnNotifier, int, int>(CounterOnNotifier.new);
