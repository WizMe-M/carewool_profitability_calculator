// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_price_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CostPriceForm on CostPriceFormBase, Store {
  Computed<String>? _$formattedCostPriceComputed;

  @override
  String get formattedCostPrice => (_$formattedCostPriceComputed ??=
          Computed<String>(() => super.formattedCostPrice,
              name: 'CostPriceFormBase.formattedCostPrice'))
      .value;

  late final _$_costPriceAtom =
      Atom(name: 'CostPriceFormBase._costPrice', context: context);

  @override
  double get _costPrice {
    _$_costPriceAtom.reportRead();
    return super._costPrice;
  }

  @override
  set _costPrice(double value) {
    _$_costPriceAtom.reportWrite(value, super._costPrice, () {
      super._costPrice = value;
    });
  }

  late final _$CostPriceFormBaseActionController =
      ActionController(name: 'CostPriceFormBase', context: context);

  @override
  void _calculateCostPrice() {
    final _$actionInfo = _$CostPriceFormBaseActionController.startAction(
        name: 'CostPriceFormBase._calculateCostPrice');
    try {
      return super._calculateCostPrice();
    } finally {
      _$CostPriceFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$CostPriceFormBaseActionController.startAction(
        name: 'CostPriceFormBase.reset');
    try {
      return super.reset();
    } finally {
      _$CostPriceFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formattedCostPrice: ${formattedCostPrice}
    ''';
  }
}
