import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// ptf => and choose autocompletion
part 'user.freezed.dart';
// pts => and choose autocompletion
part 'user.g.dart';

// fdata => and choose autocompletion
@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) = _User;

//* fromJson => and choose autocompletion
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //
}
