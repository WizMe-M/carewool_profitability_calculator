// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryItem {
  String get name => throw _privateConstructorUsedError;
  double get fbo => throw _privateConstructorUsedError;
  double get fbs => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_CategoryItem implements _CategoryItem {
  _$_CategoryItem({required this.name, required this.fbo, required this.fbs});

  @override
  final String name;
  @override
  final double fbo;
  @override
  final double fbs;

  @override
  String toString() {
    return 'CategoryItem(name: $name, fbo: $fbo, fbs: $fbs)';
  }
}

abstract class _CategoryItem implements CategoryItem {
  factory _CategoryItem(
      {required final String name,
      required final double fbo,
      required final double fbs}) = _$_CategoryItem;

  @override
  String get name;
  @override
  double get fbo;
  @override
  double get fbs;
}
