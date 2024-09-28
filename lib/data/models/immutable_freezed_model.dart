import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

/*
  Here created high productive immutable model with help of Freezed package
  as well as serialization with help of @json_serializable
 */

// ptf and then opt+space (choose autocompletion from freezed)
part 'immutable_freezed_model.freezed.dart';
part 'immutable_freezed_model.g.dart';

// fdata and  then opt+space
@freezed
class FreezedModel with _$FreezedModel {
  const factory FreezedModel(
    int id,
    String name,
    double age,
  ) = _FreezedModel;

  factory FreezedModel.fromJson(Map<String, dynamic> json) =>
      _$FreezedModelFromJson(json);
}
