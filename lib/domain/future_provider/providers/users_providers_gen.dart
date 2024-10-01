import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/user.dart';
import 'dio_provider.dart';

part 'users_providers_gen.g.dart';

@riverpod
FutureOr<List<User>> userList(UserListRef ref) async {
  ref.onDispose(() {
    print('[userListProvider] disposed');
  });
  final response = await ref.watch(dioProvider).get('/users');
  // ! dioProvider is autoDisposed Provider, so this provider have to be also autoDisposed
  // !!! OR we can use "ref.keepAlive();" to CASH DATA
  // ref.keepAlive();

  // when there is a need to test error case -- uncomment next:
  // throw 'Fail to fetch user list';
  final List userList = response.data;
  final users = [for (final user in userList) User.fromJson(user)];
  return users;
}

@riverpod
FutureOr<User> userDetail(UserDetailRef ref, int id) async {
  ref.onDispose(() {
    print('[userDetailProvider($id)] disposed');
  });
  final response = await ref.watch(dioProvider).get('/users/$id');
// ! dioProvider is autoDisposed Provider, so this provider have to be also autoDisposed
  // !!! OR we can use "ref.keepAlive();" to CASH DATA
  ref.keepAlive();
  /*
  autoDisposedProvider + ref.keepAlive() makes possible to provide next pattern:
  when successful data obtaining - cash data, when error asyncValue - try one more time (don't cash)
  ? What the difference between provider with option (keepAlive: true) ?
   */

  final user = User.fromJson(response.data);
  return user;
}
