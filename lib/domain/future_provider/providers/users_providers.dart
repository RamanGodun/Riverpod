import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/data/models/user.dart';

import 'dio_provider.dart';

// futureProvider => choose autocompletion
final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  ref.onDispose(() {
    print('[userListProvider] disposed');
  });

  final response = await ref.watch(dioProvider).get('/users');
  // ! dioProvider is autoDisposed Provider, so this provider have to be also autoDisposed

  // when there is a need to test error case -- uncomment next:
  // throw 'Fail to fetch user list';
  final List userList = response.data;
  final users = [for (final user in userList) User.fromJson(user)];
  return users;
});

final userDetailProvider =
    FutureProvider.autoDispose.family<User, int>((ref, id) async {
  ref.onDispose(() {
    print('[userDetailProvider($id)] disposed');
  });

  final response = await ref.watch(dioProvider).get('/users/$id');
  // ! dioProvider is autoDisposed Provider, so this provider have to be also autoDisposed
  // !!! OR we can use "ref.keepAlive();" to CASH DATA
  ref.keepAlive();
  final user = User.fromJson(response.data);
  return user;
});
