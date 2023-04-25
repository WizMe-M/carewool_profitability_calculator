// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculatorForm on CalculatorFormBase, Store {
  Computed<String>? _$costFormattedComputed;

  @override
  String get costFormatted =>
      (_$costFormattedComputed ??= Computed<String>(() => super.costFormatted,
              name: 'CalculatorFormBase.costFormatted'))
          .value;
  Computed<bool>? _$nameFilledComputed;

  @override
  bool get nameFilled =>
      (_$nameFilledComputed ??= Computed<bool>(() => super.nameFilled,
              name: 'CalculatorFormBase.nameFilled'))
          .value;
  Computed<bool>? _$isCostPositiveComputed;

  @override
  bool get isCostPositive =>
      (_$isCostPositiveComputed ??= Computed<bool>(() => super.isCostPositive,
              name: 'CalculatorFormBase.isCostPositive'))
          .value;
  Computed<bool>? _$canBeSavedComputed;

  @override
  bool get canBeSaved =>
      (_$canBeSavedComputed ??= Computed<bool>(() => super.canBeSaved,
              name: 'CalculatorFormBase.canBeSaved'))
          .value;

  late final _$_totalCostAtom =
      Atom(name: 'CalculatorFormBase._totalCost', context: context);

  @override
  double get _totalCost {
    _$_totalCostAtom.reportRead();
    return super._totalCost;
  }

  @override
  set _totalCost(double value) {
    _$_totalCostAtom.reportWrite(value, super._totalCost, () {
      super._totalCost = value;
    });
  }

  late final _$CalculatorFormBaseActionController =
      ActionController(name: 'CalculatorFormBase', context: context);

  @override
  void _calculateTotalCost() {
    final _$actionInfo = _$CalculatorFormBaseActionController.startAction(
        name: 'CalculatorFormBase._calculateTotalCost');
    try {
      return super._calculateTotalCost();
    } finally {
      _$CalculatorFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$CalculatorFormBaseActionController.startAction(
        name: 'CalculatorFormBase.reset');
    try {
      return super.reset();
    } finally {
      _$CalculatorFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
costFormatted: ${costFormatted},
nameFilled: ${nameFilled},
isCostPositive: ${isCostPositive},
canBeSaved: ${canBeSaved}
    ''';
  }
}
