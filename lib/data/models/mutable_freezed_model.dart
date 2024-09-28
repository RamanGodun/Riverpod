import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

/*
  Here created mutable model with help of Freezed package
  as well as serialization with help of @json_serializable
 */

part 'mutable_freezed_model.freezed.dart';
part 'mutable_freezed_model.g.dart';

@unfreezed
class FreezedModelMutable with _$FreezedModelMutable {
  factory FreezedModelMutable({
    required int id,
    required String name,
    required double age,
  }) = _FreezedModelMutable;

  // Додаємо фабричний конструктор для JSON-серіалізації
  factory FreezedModelMutable.fromJson(Map<String, dynamic> json) =>
      _$FreezedModelMutableFromJson(json);
}
