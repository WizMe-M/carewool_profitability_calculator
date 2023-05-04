// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get name => throw _privateConstructorUsedError;
  DateTime get savedDate => throw _privateConstructorUsedError;
  List<Block> get blocks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_Product extends _Product {
  _$_Product(
      {required this.name,
      required this.savedDate,
      required final List<Block> blocks})
      : _blocks = blocks,
        super._();

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$$_ProductFromJson(json);

  @override
  final String name;
  @override
  final DateTime savedDate;
  final List<Block> _blocks;
  @override
  List<Block> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  @override
  String toString() {
    return 'Product(name: $name, savedDate: $savedDate, blocks: $blocks)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  factory _Product(
      {required final String name,
      required final DateTime savedDate,
      required final List<Block> blocks}) = _$_Product;
  _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  String get name;
  @override
  DateTime get savedDate;
  @override
  List<Block> get blocks;
}

Block _$BlockFromJson(Map<String, dynamic> json) {
  return _Block.fromJson(json);
}

/// @nodoc
mixin _$Block {
  String get name => throw _privateConstructorUsedError;
  List<Parameter> get parameters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_Block implements _Block {
  _$_Block({required this.name, required final List<Parameter> parameters})
      : _parameters = parameters;

  factory _$_Block.fromJson(Map<String, dynamic> json) =>
      _$$_BlockFromJson(json);

  @override
  final String name;
  final List<Parameter> _parameters;
  @override
  List<Parameter> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  String toString() {
    return 'Block(name: $name, parameters: $parameters)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlockToJson(
      this,
    );
  }
}

abstract class _Block implements Block {
  factory _Block(
      {required final String name,
      required final List<Parameter> parameters}) = _$_Block;

  factory _Block.fromJson(Map<String, dynamic> json) = _$_Block.fromJson;

  @override
  String get name;
  @override
  List<Parameter> get parameters;
}

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  return _Parameter.fromJson(json);
}

/// @nodoc
mixin _$Parameter {
  String get name => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
}
