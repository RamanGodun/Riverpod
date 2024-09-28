// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'immutable_freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FreezedModel _$FreezedModelFromJson(Map<String, dynamic> json) {
  return _FreezedModel.fromJson(json);
}

/// @nodoc
mixin _$FreezedModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get age => throw _privateConstructorUsedError;

  /// Serializes this FreezedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FreezedModelCopyWith<FreezedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedModelCopyWith<$Res> {
  factory $FreezedModelCopyWith(
          FreezedModel value, $Res Function(FreezedModel) then) =
      _$FreezedModelCopyWithImpl<$Res, FreezedModel>;
  @useResult
  $Res call({int id, String name, double age});
}

/// @nodoc
class _$FreezedModelCopyWithImpl<$Res, $Val extends FreezedModel>
    implements $FreezedModelCopyWith<$Res> {
  _$FreezedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreezedModelImplCopyWith<$Res>
    implements $FreezedModelCopyWith<$Res> {
  factory _$$FreezedModelImplCopyWith(
          _$FreezedModelImpl value, $Res Function(_$FreezedModelImpl) then) =
      __$$FreezedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, double age});
}

/// @nodoc
class __$$FreezedModelImplCopyWithImpl<$Res>
    extends _$FreezedModelCopyWithImpl<$Res, _$FreezedModelImpl>
    implements _$$FreezedModelImplCopyWith<$Res> {
  __$$FreezedModelImplCopyWithImpl(
      _$FreezedModelImpl _value, $Res Function(_$FreezedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_$FreezedModelImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreezedModelImpl with DiagnosticableTreeMixin implements _FreezedModel {
  const _$FreezedModelImpl(this.id, this.name, this.age);

  factory _$FreezedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreezedModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FreezedModel(id: $id, name: $name, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FreezedModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreezedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, age);

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FreezedModelImplCopyWith<_$FreezedModelImpl> get copyWith =>
      __$$FreezedModelImplCopyWithImpl<_$FreezedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreezedModelImplToJson(
      this,
    );
  }
}

abstract class _FreezedModel implements FreezedModel {
  const factory _FreezedModel(
      final int id, final String name, final double age) = _$FreezedModelImpl;

  factory _FreezedModel.fromJson(Map<String, dynamic> json) =
      _$FreezedModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get age;

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FreezedModelImplCopyWith<_$FreezedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
