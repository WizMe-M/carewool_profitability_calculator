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

  late final _$widthValueAtom =
      Atom(name: 'SizeFormBase.widthValue', context: context);

  @override
  double get widthValue {
    _$widthValueAtom.reportRead();
    return super.widthValue;
  }

  @override
  set widthValue(double value) {
    _$widthValueAtom.reportWrite(value, super.widthValue, () {
      super.widthValue = value;
    });
  }

  late final _$heightValueAtom =
      Atom(name: 'SizeFormBase.heightValue', context: context);

  @override
  double get heightValue {
    _$heightValueAtom.reportRead();
    return super.heightValue;
  }

  @override
  set heightValue(double value) {
    _$heightValueAtom.reportWrite(value, super.heightValue, () {
      super.heightValue = value;
    });
  }

  late final _$lengthValueAtom =
      Atom(name: 'SizeFormBase.lengthValue', context: context);

  @override
  double get lengthValue {
    _$lengthValueAtom.reportRead();
    return super.lengthValue;
  }

  @override
  set lengthValue(double value) {
    _$lengthValueAtom.reportWrite(value, super.lengthValue, () {
      super.lengthValue = value;
    });
  }

  @override
  String toString() {
    return '''
widthValue: ${widthValue},
heightValue: ${heightValue},
lengthValue: ${lengthValue},
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
