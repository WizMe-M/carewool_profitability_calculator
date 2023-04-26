// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_calculator_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CostCalculatorForm on CostCalculatorFormBase, Store {
  Computed<String>? _$costFormattedComputed;

  @override
  String get costFormatted =>
      (_$costFormattedComputed ??= Computed<String>(() => super.costFormatted,
              name: 'CostCalculatorFormBase.costFormatted'))
          .value;

  late final _$_totalCostAtom =
      Atom(name: 'CostCalculatorFormBase._totalCost', context: context);

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

  late final _$CostCalculatorFormBaseActionController =
      ActionController(name: 'CostCalculatorFormBase', context: context);

  @override
  void _calculateTotalCost() {
    final _$actionInfo = _$CostCalculatorFormBaseActionController.startAction(
        name: 'CostCalculatorFormBase._calculateTotalCost');
    try {
      return super._calculateTotalCost();
    } finally {
      _$CostCalculatorFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$CostCalculatorFormBaseActionController.startAction(
        name: 'CostCalculatorFormBase.reset');
    try {
      return super.reset();
    } finally {
      _$CostCalculatorFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
costFormatted: ${costFormatted}
    ''';
  }
}
