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

/// @nodoc
mixin _$Product {
  String get name => throw _privateConstructorUsedError;
  DateTime get savedDate => throw _privateConstructorUsedError;
  List<Block> get blocks => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Product extends _Product {
  _$_Product(
      {required this.name,
      required this.savedDate,
      required final List<Block> blocks})
      : _blocks = blocks,
        super._();

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
}

abstract class _Product extends Product {
  factory _Product(
      {required final String name,
      required final DateTime savedDate,
      required final List<Block> blocks}) = _$_Product;
  _Product._() : super._();

  @override
  String get name;
  @override
  DateTime get savedDate;
  @override
  List<Block> get blocks;
}

/// @nodoc
mixin _$Block {
  String get name => throw _privateConstructorUsedError;
  List<Parameter> get parameters => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Block implements _Block {
  _$_Block({required this.name, required final List<Parameter> parameters})
      : _parameters = parameters;

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
}

abstract class _Block implements Block {
  factory _Block(
      {required final String name,
      required final List<Parameter> parameters}) = _$_Block;

  @override
  String get name;
  @override
  List<Parameter> get parameters;
}

/// @nodoc
mixin _$Parameter {
  String get name => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Parameter implements _Parameter {
  _$_Parameter({required this.name, required this.cost});

  @override
  final String name;
  @override
  final double cost;

  @override
  String toString() {
    return 'Parameter(name: $name, cost: $cost)';
  }
}

abstract class _Parameter implements Parameter {
  factory _Parameter({required final String name, required final double cost}) =
      _$_Parameter;

  @override
  String get name;
  @override
  double get cost;
}
