// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  return _Parameter.fromJson(json);
}

/// @nodoc
mixin _$Parameter {
  String get name => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParameterCopyWith<Parameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParameterCopyWith<$Res> {
  factory $ParameterCopyWith(Parameter value, $Res Function(Parameter) then) =
      _$ParameterCopyWithImpl<$Res, Parameter>;
  @useResult
  $Res call({String name, double cost});
}

/// @nodoc
class _$ParameterCopyWithImpl<$Res, $Val extends Parameter>
    implements $ParameterCopyWith<$Res> {
  _$ParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cost = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParameterCopyWith<$Res> implements $ParameterCopyWith<$Res> {
  factory _$$_ParameterCopyWith(
          _$_Parameter value, $Res Function(_$_Parameter) then) =
      __$$_ParameterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double cost});
}

/// @nodoc
class __$$_ParameterCopyWithImpl<$Res>
    extends _$ParameterCopyWithImpl<$Res, _$_Parameter>
    implements _$$_ParameterCopyWith<$Res> {
  __$$_ParameterCopyWithImpl(
      _$_Parameter _value, $Res Function(_$_Parameter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? cost = null,
  }) {
    return _then(_$_Parameter(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Parameter implements _Parameter {
  _$_Parameter({required this.name, required this.cost});

  factory _$_Parameter.fromJson(Map<String, dynamic> json) =>
      _$$_ParameterFromJson(json);

  @override
  final String name;
  @override
  final double cost;

  @override
  String toString() {
    return 'Parameter(name: $name, cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Parameter &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, cost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParameterCopyWith<_$_Parameter> get copyWith =>
      __$$_ParameterCopyWithImpl<_$_Parameter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParameterToJson(
      this,
    );
  }
}

abstract class _Parameter implements Parameter {
  factory _Parameter({required final String name, required final double cost}) =
      _$_Parameter;

  factory _Parameter.fromJson(Map<String, dynamic> json) =
      _$_Parameter.fromJson;

  @override
  String get name;
  @override
  double get cost;
  @override
  @JsonKey(ignore: true)
  _$$_ParameterCopyWith<_$_Parameter> get copyWith =>
      throw _privateConstructorUsedError;
}
