// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_calc_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductCalcForm on ProductCalcFormBase, Store {
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??=
          Computed<String>(() => super.name, name: 'ProductCalcFormBase.name'))
      .value;
  Computed<String>? _$totalComputed;

  @override
  String get total => (_$totalComputed ??= Computed<String>(() => super.total,
          name: 'ProductCalcFormBase.total'))
      .value;
  Computed<bool>? _$canBeSavedComputed;

  @override
  bool get canBeSaved =>
      (_$canBeSavedComputed ??= Computed<bool>(() => super.canBeSaved,
              name: 'ProductCalcFormBase.canBeSaved'))
          .value;
  Computed<String>? _$buttonTextComputed;

  @override
  String get buttonText =>
      (_$buttonTextComputed ??= Computed<String>(() => super.buttonText,
              name: 'ProductCalcFormBase.buttonText'))
          .value;

  late final _$isAppliedAtom =
      Atom(name: 'ProductCalcFormBase.isApplied', context: context);

  @override
  bool get isApplied {
    _$isAppliedAtom.reportRead();
    return super.isApplied;
  }

  @override
  set isApplied(bool value) {
    _$isAppliedAtom.reportWrite(value, super.isApplied, () {
      super.isApplied = value;
    });
  }

  late final _$productNameAtom =
      Atom(name: 'ProductCalcFormBase.productName', context: context);

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  late final _$_totalSumAtom =
      Atom(name: 'ProductCalcFormBase._totalSum', context: context);

  @override
  double get _totalSum {
    _$_totalSumAtom.reportRead();
    return super._totalSum;
  }

  @override
  set _totalSum(double value) {
    _$_totalSumAtom.reportWrite(value, super._totalSum, () {
      super._totalSum = value;
    });
  }

  late final _$ProductCalcFormBaseActionController =
      ActionController(name: 'ProductCalcFormBase', context: context);

  @override
  void calculateTotal() {
    final _$actionInfo = _$ProductCalcFormBaseActionController.startAction(
        name: 'ProductCalcFormBase.calculateTotal');
    try {
      return super.calculateTotal();
    } finally {
      _$ProductCalcFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$ProductCalcFormBaseActionController.startAction(
        name: 'ProductCalcFormBase.reset');
    try {
      return super.reset();
    } finally {
      _$ProductCalcFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleButton() {
    final _$actionInfo = _$ProductCalcFormBaseActionController.startAction(
        name: 'ProductCalcFormBase.toggleButton');
    try {
      return super.toggleButton();
    } finally {
      _$ProductCalcFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isApplied: ${isApplied},
productName: ${productName},
name: ${name},
total: ${total},
canBeSaved: ${canBeSaved},
buttonText: ${buttonText}
    ''';
  }
}
