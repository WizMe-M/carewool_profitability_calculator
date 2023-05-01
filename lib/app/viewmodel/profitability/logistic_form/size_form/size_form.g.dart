// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SizeForm on SizeFormBase, Store {
  Computed<double>? _$volumeComputed;

  @override
  double get volume => (_$volumeComputed ??=
          Computed<double>(() => super.volume, name: 'SizeFormBase.volume'))
      .value;
  Computed<int>? _$volumeInLitersComputed;

  @override
  int get volumeInLiters =>
      (_$volumeInLitersComputed ??= Computed<int>(() => super.volumeInLiters,
              name: 'SizeFormBase.volumeInLiters'))
          .value;
  Computed<int>? _$overLiterCapComputed;

  @override
  int get overLiterCap =>
      (_$overLiterCapComputed ??= Computed<int>(() => super.overLiterCap,
              name: 'SizeFormBase.overLiterCap'))
          .value;
  Computed<bool>? _$isExtraLargeProductComputed;

  @override
  bool get isExtraLargeProduct => (_$isExtraLargeProductComputed ??=
          Computed<bool>(() => super.isExtraLargeProduct,
              name: 'SizeFormBase.isExtraLargeProduct'))
      .value;

  @override
  String toString() {
    return '''
volume: ${volume},
volumeInLiters: ${volumeInLiters},
overLiterCap: ${overLiterCap},
isExtraLargeProduct: ${isExtraLargeProduct}
    ''';
  }
}
