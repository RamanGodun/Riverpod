import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider with autoDispose and family modifiers.
// The provider is automatically disposed when not in use.
final familyAutoDisposedCounterProvider =
    StateProvider.autoDispose.family<int, int>((ref, initialValue) {
  // Callback triggered when the provider is disposed.
  ref.onDispose(() =>
      print('[familyAutoDisposedCounterProvider $initialValue] was disposed'));

  // The initial state is set to the value passed into the provider.
  return initialValue;
});
