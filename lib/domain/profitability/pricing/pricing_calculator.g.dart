// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_calculator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PricingCalculator on PricingCalculatorBase, Store {
  Computed<Commission>? _$selectedComputed;

  @override
  Commission get selected =>
      (_$selectedComputed ??= Computed<Commission>(() => super.selected,
              name: 'PricingCalculatorBase.selected'))
          .value;
  Computed<double>? _$commissionComputed;

  @override
  double get commission =>
      (_$commissionComputed ??= Computed<double>(() => super.commission,
              name: 'PricingCalculatorBase.commission'))
          .value;
  Computed<double>? _$commissionSizeComputed;

  @override
  double get commissionSize =>
      (_$commissionSizeComputed ??= Computed<double>(() => super.commissionSize,
              name: 'PricingCalculatorBase.commissionSize'))
          .value;
  Computed<String>? _$commissionFormattedComputed;

  @override
  String get commissionFormatted => (_$commissionFormattedComputed ??=
          Computed<String>(() => super.commissionFormatted,
              name: 'PricingCalculatorBase.commissionFormatted'))
      .value;
  Computed<String>? _$commissionSizeFormattedComputed;

  @override
  String get commissionSizeFormatted => (_$commissionSizeFormattedComputed ??=
          Computed<String>(() => super.commissionSizeFormatted,
              name: 'PricingCalculatorBase.commissionSizeFormatted'))
      .value;

  @override
  String toString() {
    return '''
selected: ${selected},
commission: ${commission},
commissionSize: ${commissionSize},
commissionFormatted: ${commissionFormatted},
commissionSizeFormatted: ${commissionSizeFormatted}
    ''';
  }
}
