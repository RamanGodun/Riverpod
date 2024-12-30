import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_3_plus_auto_dispose_family_mod.g.dart';

@riverpod
String autoDisposeFamily(Ref ref, {required String customName}) {
  print('[autoDisposeFamilyProvider($customName)] was created');
  ref.onDispose(() {
    print('[autoDisposeFamilyProvider($customName)] was disposed');
  });

  return 'Hello auto family $customName';
}

/*
 This provider is created on demand (when it is watched in the UI)
 and automatically disposed when no widget is using it.

 If we use this provider with different arguments on the same page,
 it will create and dispose separate instances for each argument.

 However, if we call this provider multiple times on the same page
 with the same argument, it will create and dispose the instance only once.

 It's important to override `hashCode` and the equality operator (`==`)
 when working with family providers that use complex objects as keys.
 This can be easily achieved with the help of libraries like `freezed`, `equatable`, or `tuple`.
 Failure to do so may result in unintended behavior or memory leaks.

 Use this provider when you do not need to persist the state
 throughout the entire lifecycle of the app.
 */
