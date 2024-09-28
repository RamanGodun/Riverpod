// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'immutable_freezed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FreezedModelImpl _$$FreezedModelImplFromJson(Map<String, dynamic> json) =>
    _$FreezedModelImpl(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['age'] as num).toDouble(),
    );

Map<String, dynamic> _$$FreezedModelImplToJson(_$FreezedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
    };
