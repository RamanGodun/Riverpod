import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterChangeNotifier extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  @override
  String toString() => 'CounterChangeNotifier(counter: $counter)';
}

final counterChangeNotifierProvider =
    ChangeNotifierProvider<CounterChangeNotifier>((ref) {
  return CounterChangeNotifier();
});
