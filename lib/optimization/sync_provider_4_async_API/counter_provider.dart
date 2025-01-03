/*

 */
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'main.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final currentValue = preferences.getInt('counter') ?? 0;

    ref.listenSelf((previous, next) {
      print('previous: $previous, next: $next');
      preferences.setInt('counter', next);
    });

    return currentValue;
  }

  void increment() {
    state++;
  }
}
/*
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'main.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final currentValue = preferences.getInt('counter') ?? 0;

    // Використання Notifier.listenSelf замість ref.listenSelf
    Notifier.listenSelf((previous, next) {
      print('previous: $previous, next: $next');
      preferences.setInt('counter', next);
    });

    return currentValue;
  }

  void increment() {
    state++;
  }
}
*/
