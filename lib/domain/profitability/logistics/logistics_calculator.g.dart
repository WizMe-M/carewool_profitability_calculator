// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistics_calculator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LogisticsCalculator on LogisticsCalculatorBase, Store {
  Computed<Storage>? _$selectedComputed;

  @override
  Storage get selected =>
      (_$selectedComputed ??= Computed<Storage>(() => super.selected,
              name: 'LogisticsCalculatorBase.selected'))
          .value;
  Computed<double>? _$costForSizeComputed;

  @override
  double get costForSize =>
      (_$costForSizeComputed ??= Computed<double>(() => super.costForSize,
              name: 'LogisticsCalculatorBase.costForSize'))
          .value;
  Computed<double>? _$costForExtraLargeComputed;

  @override
  double get costForExtraLarge => (_$costForExtraLargeComputed ??=
          Computed<double>(() => super.costForExtraLarge,
              name: 'LogisticsCalculatorBase.costForExtraLarge'))
      .value;
  Computed<double>? _$totalCostComputed;

  @override
  double get totalCost =>
      (_$totalCostComputed ??= Computed<double>(() => super.totalCost,
              name: 'LogisticsCalculatorBase.totalCost'))
          .value;
  Computed<String>? _$totalCostFormattedComputed;

  @override
  String get totalCostFormatted => (_$totalCostFormattedComputed ??=
          Computed<String>(() => super.totalCostFormatted,
              name: 'LogisticsCalculatorBase.totalCostFormatted'))
      .value;

  @override
  String toString() {
    return '''
selected: ${selected},
costForSize: ${costForSize},
costForExtraLarge: ${costForExtraLarge},
totalCost: ${totalCost},
totalCostFormatted: ${totalCostFormatted}
    ''';
  }
}
