import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example2_provider.g.dart';

// Провайдер для лічильника зі значенням 0
@Riverpod(keepAlive: true, dependencies: [])
class Ex2Counter extends _$Ex2Counter {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
}

// Лічильник з початковим значенням 10
class Ex2Counter10 extends Ex2Counter {
  @override
  int build() {
    return 10;
  }
}

// Лічильник з початковим значенням 100
class Ex2Counter100 extends Ex2Counter {
  @override
  int build() {
    return 100;
  }
}

// Провайдер для обчисленого значення, залежить від `Ex2Counter`
@Riverpod(dependencies: [Ex2Counter])
int ex2AdjustedCounter(Ref ref) {
  return ref.watch(ex2CounterProvider) * 2;
}
