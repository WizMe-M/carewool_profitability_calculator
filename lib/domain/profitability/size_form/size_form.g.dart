// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SizeForm on SizeFormBase, Store {
  Computed<String>? _$widthFormattedComputed;

  @override
  String get widthFormatted =>
      (_$widthFormattedComputed ??= Computed<String>(() => super.widthFormatted,
              name: 'SizeFormBase.widthFormatted'))
          .value;
  Computed<String>? _$heightFormattedComputed;

  @override
  String get heightFormatted => (_$heightFormattedComputed ??= Computed<String>(
          () => super.heightFormatted,
          name: 'SizeFormBase.heightFormatted'))
      .value;
  Computed<String>? _$lengthFormattedComputed;

  @override
  String get lengthFormatted => (_$lengthFormattedComputed ??= Computed<String>(
          () => super.lengthFormatted,
          name: 'SizeFormBase.lengthFormatted'))
      .value;
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

  late final _$widthAtom = Atom(name: 'SizeFormBase.width', context: context);

  @override
  double get width {
    _$widthAtom.reportRead();
    return super.width;
  }

  @override
  set width(double value) {
    _$widthAtom.reportWrite(value, super.width, () {
      super.width = value;
    });
  }

  late final _$heightAtom = Atom(name: 'SizeFormBase.height', context: context);

  @override
  double get height {
    _$heightAtom.reportRead();
    return super.height;
  }

  @override
  set height(double value) {
    _$heightAtom.reportWrite(value, super.height, () {
      super.height = value;
    });
  }

  late final _$lengthAtom = Atom(name: 'SizeFormBase.length', context: context);

  @override
  double get length {
    _$lengthAtom.reportRead();
    return super.length;
  }

  @override
  set length(double value) {
    _$lengthAtom.reportWrite(value, super.length, () {
      super.length = value;
    });
  }

  @override
  String toString() {
    return '''
width: ${width},
height: ${height},
length: ${length},
widthFormatted: ${widthFormatted},
heightFormatted: ${heightFormatted},
lengthFormatted: ${lengthFormatted},
volume: ${volume},
volumeInLiters: ${volumeInLiters},
overLiterCap: ${overLiterCap},
isExtraLargeProduct: ${isExtraLargeProduct}
    ''';
  }
}
