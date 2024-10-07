import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// asyncNotifier => autocompletion
// class Counter extends AutoDisposeFamilyNotifier<int, int> {
//   @override
//   int build(int arg) {
//     ref.onDispose(() {
//       print('[counterProvider] disposed');
//     });
//     return arg;
//   }

//   void increment() {
//     state++;
//   }
// }

// final counterProvider =
//     NotifierProvider.autoDispose.family<Counter, int, int>(Counter.new);

// asyncNotifierProvider => autocompletion
final counterProvider = AsyncNotifierProvider<Counter, int>(Counter.new);

class Counter extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() async {
    ref.onDispose(() => print('[counterProvider] was disposed'));

    await waitASecond();

    return 0;
  }

  Future<void> waitASecond() => Future.delayed(
        const Duration(seconds: 1),
      );

// ! "error" and "StackTrace" objects - are required objects of AsyncError
  Future<void> increment() async {
    state = const AsyncLoading();

    try {
      await waitASecond();
      // throw 'Fail to increment'; //uncomment for error testing
      // !previous value saved in AsyncValue (state.value)
      state = AsyncData(state.value! + 1);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      // ! if "StackTrace" objects isn't available, then take StackTrace.current
    }
  }

  Future<void> decrement() async {
    state = const AsyncLoading();

    try {
      await waitASecond();
      // !previous value saved in AsyncValue (state.value)
      state = AsyncData(state.value! - 1);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      // ! if "StackTrace" objects isn't available, then take StackTrace.current
    }
  }
  //
  //
}
