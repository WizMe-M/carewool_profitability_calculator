// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Category {
  String get name => throw _privateConstructorUsedError;
  List<CategoryItem> get items => throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Category implements _Category {
  _$_Category({required this.name, required this.items});

  @override
  final String name;
  @override
  final List<CategoryItem> items;

  @override
  String toString() {
    return 'Category(name: $name, items: $items)';
  }
}

abstract class _Category implements Category {
  factory _Category(
      {required final String name,
      required final List<CategoryItem> items}) = _$_Category;

  @override
  String get name;
  @override
  List<CategoryItem> get items;
}
