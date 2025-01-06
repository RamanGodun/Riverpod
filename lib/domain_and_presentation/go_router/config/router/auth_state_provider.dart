import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/providers/shared_pref_provider.dart';

part 'auth_state_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  bool build() {
    return ref.watch(sharedPreferencesProvider).getBool('auth') ?? false;
  }

  Future<void> setAuthenticate(bool value) async {
    await ref.read(sharedPreferencesProvider).setBool('auth', value);
    state = value;
  }
}
