// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../../data/models/user.dart';
// import 'dio_provider.dart';

// part 'users_providers_gen.g.dart';

// @riverpod
// FutureOr<List<User>> userList(UserListRef ref) async {
//   ref.onDispose(() {
//     print('[userListProvider] disposed');
//   });
//   final response = await ref.watch(dioProvider).get('/users');
//   // throw 'Fail to fetch user list';
//   final List userList = response.data;
//   final users = [for (final user in userList) User.fromJson(user)];
//   return users;
// }

// @riverpod
// FutureOr<User> userDetail(UserDetailRef ref, int id) async {
//   ref.onDispose(() {
//     print('[userDetailProvider($id)] disposed');
//   });
//   final response = await ref.watch(dioProvider).get('/users/$id');
//   final user = User.fromJson(response.data);
//   return user;
// }
