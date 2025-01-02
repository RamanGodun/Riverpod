import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_provider.g.dart';

// next used only  for optimization, when  initialization of Synch Provider for Async APIs
@Riverpod(dependencies: [])
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}
