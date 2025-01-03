import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider.autoDispose<int>(
  (ref) {
    return 0;
  },
  name: 'counterStateProvider',
);
