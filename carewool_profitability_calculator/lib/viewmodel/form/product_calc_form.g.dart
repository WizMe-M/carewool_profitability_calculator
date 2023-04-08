// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_calc_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductCalcForm on ProductCalcFormBase, Store {
  Computed<String>? _$totalComputed;

  @override
  String get total => (_$totalComputed ??= Computed<String>(() => super.total,
          name: 'ProductCalcFormBase.total'))
      .value;

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
  String toString() {
    return '''
total: ${total}
    ''';
  }
}
