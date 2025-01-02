import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../main.dart';

part 'counter_provider.g.dart';

@riverpod
// use template with riverpodClass and then change it
class Counter extends _$Counter {
  @override
  int build() {
    final preferences = ref.watch(sharedPreferencesProvider);
    final currentValue = preferences.getInt('counter') ?? 0;

    // Використовуйте Notifier.listenSelf замість ref.listenSelf
    listenSelf((previous, next) {
      print('previous: $previous, next: $next');
      preferences.setInt('counter', next);
    });

    return currentValue;
  }

  void increment() {
    state++;
  }
}
