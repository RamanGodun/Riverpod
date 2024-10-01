// import 'package:flutter/foundation.dart'; // for objects "good look"
import 'package:freezed_annotation/freezed_annotation.dart';

// ptf => and choose autocompletion
part 'user.freezed.dart';
// pts => and choose autocompletion
part 'user.g.dart';

// fdata => and choose autocompletion
@freezed
class User with _$User {
/*
 *If u want to see (in console after print) not all data (name, username, email...), but next:
flutter: AsyncData<List<User>>(value: [User(id: 1), User(id: 2), User(id: 3), User(id: 4), User(id: 5),...])
!  u need to create unnamed private constructor (const User._();)
! so then u can to create getter, setter or method in freezed class
*and comment out the "foundation.dart" package, because it create toString() automatically for ALL PARAMETERS (name, username, email ...),
* AND uncomment custom toString() method
* finally launch code generation
 */
  // const User._();

  const factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) = _User;

  // @override
  // String toString() => 'User(id: $id)';

//* fromJson => and choose autocompletion
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //
}
