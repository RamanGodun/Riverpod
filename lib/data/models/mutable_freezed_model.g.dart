// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutable_freezed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreezedModelMutableImpl _$$FreezedModelMutableImplFromJson(
        Map<String, dynamic> json) =>
    _$FreezedModelMutableImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      age: (json['age'] as num).toDouble(),
    );

Map<String, dynamic> _$$FreezedModelMutableImplToJson(
        _$FreezedModelMutableImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
    };
