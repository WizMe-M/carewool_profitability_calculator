// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistic_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LogisticCalculator on LogisticCalculatorBase, Store {
  Computed<Tariff?>? _$logisticTariffComputed;

  @override
  Tariff? get logisticTariff => (_$logisticTariffComputed ??= Computed<Tariff?>(
          () => super.logisticTariff,
          name: 'LogisticCalculatorBase.logisticTariff'))
      .value;
  Computed<double>? _$baseCostComputed;

  @override
  double get baseCost =>
      (_$baseCostComputed ??= Computed<double>(() => super.baseCost,
              name: 'LogisticCalculatorBase.baseCost'))
          .value;
  Computed<double>? _$costPerLiterComputed;

  @override
  double get costPerLiter =>
      (_$costPerLiterComputed ??= Computed<double>(() => super.costPerLiter,
              name: 'LogisticCalculatorBase.costPerLiter'))
          .value;
  Computed<double>? _$costForSizeComputed;

  @override
  double get costForSize =>
      (_$costForSizeComputed ??= Computed<double>(() => super.costForSize,
              name: 'LogisticCalculatorBase.costForSize'))
          .value;
  Computed<double>? _$costForExtraLargeComputed;

  @override
  double get costForExtraLarge => (_$costForExtraLargeComputed ??=
          Computed<double>(() => super.costForExtraLarge,
              name: 'LogisticCalculatorBase.costForExtraLarge'))
      .value;
  Computed<double>? _$totalCostComputed;

  @override
  double get totalCost =>
      (_$totalCostComputed ??= Computed<double>(() => super.totalCost,
              name: 'LogisticCalculatorBase.totalCost'))
          .value;

  @override
  String toString() {
    return '''
logisticTariff: ${logisticTariff},
baseCost: ${baseCost},
costPerLiter: ${costPerLiter},
costForSize: ${costForSize},
costForExtraLarge: ${costForExtraLarge},
totalCost: ${totalCost}
    ''';
  }
}
