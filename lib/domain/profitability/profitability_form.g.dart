// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profitability_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfitabilityForm on ProfitabilityFormBase, Store {
  Computed<Tariff?>? _$logisticTariffComputed;

  @override
  Tariff? get logisticTariff => (_$logisticTariffComputed ??= Computed<Tariff?>(
          () => super.logisticTariff,
          name: 'ProfitabilityFormBase.logisticTariff'))
      .value;
  Computed<double>? _$logisticBaseCostComputed;

  @override
  double get logisticBaseCost => (_$logisticBaseCostComputed ??=
          Computed<double>(() => super.logisticBaseCost,
              name: 'ProfitabilityFormBase.logisticBaseCost'))
      .value;
  Computed<double>? _$logisticCostPerLiterComputed;

  @override
  double get logisticCostPerLiter => (_$logisticCostPerLiterComputed ??=
          Computed<double>(() => super.logisticCostPerLiter,
              name: 'ProfitabilityFormBase.logisticCostPerLiter'))
      .value;
  Computed<double>? _$logisticCostForSizeComputed;

  @override
  double get logisticCostForSize => (_$logisticCostForSizeComputed ??=
          Computed<double>(() => super.logisticCostForSize,
              name: 'ProfitabilityFormBase.logisticCostForSize'))
      .value;
  Computed<double>? _$logisticCostForExtraLargeComputed;

  @override
  double get logisticCostForExtraLarge =>
      (_$logisticCostForExtraLargeComputed ??= Computed<double>(
              () => super.logisticCostForExtraLarge,
              name: 'ProfitabilityFormBase.logisticCostForExtraLarge'))
          .value;
  Computed<double>? _$paidAcceptanceCostComputed;

  @override
  double get paidAcceptanceCost => (_$paidAcceptanceCostComputed ??=
          Computed<double>(() => super.paidAcceptanceCost,
              name: 'ProfitabilityFormBase.paidAcceptanceCost'))
      .value;
  Computed<double>? _$logisticTotalCostComputed;

  @override
  double get logisticTotalCost => (_$logisticTotalCostComputed ??=
          Computed<double>(() => super.logisticTotalCost,
              name: 'ProfitabilityFormBase.logisticTotalCost'))
      .value;
  Computed<double>? _$discountedCostComputed;

  @override
  double get discountedCost =>
      (_$discountedCostComputed ??= Computed<double>(() => super.discountedCost,
              name: 'ProfitabilityFormBase.discountedCost'))
          .value;
  Computed<double>? _$commissionForCostComputed;

  @override
  double get commissionForCost => (_$commissionForCostComputed ??=
          Computed<double>(() => super.commissionForCost,
              name: 'ProfitabilityFormBase.commissionForCost'))
      .value;
  Computed<double>? _$totalPaymentsComputed;

  @override
  double get totalPayments =>
      (_$totalPaymentsComputed ??= Computed<double>(() => super.totalPayments,
              name: 'ProfitabilityFormBase.totalPayments'))
          .value;
  Computed<double>? _$taxSizeComputed;

  @override
  double get taxSize =>
      (_$taxSizeComputed ??= Computed<double>(() => super.taxSize,
              name: 'ProfitabilityFormBase.taxSize'))
          .value;

  late final _$desiredCostValueAtom =
      Atom(name: 'ProfitabilityFormBase.desiredCostValue', context: context);

  @override
  double get desiredCostValue {
    _$desiredCostValueAtom.reportRead();
    return super.desiredCostValue;
  }

  @override
  set desiredCostValue(double value) {
    _$desiredCostValueAtom.reportWrite(value, super.desiredCostValue, () {
      super.desiredCostValue = value;
    });
  }

  late final _$discountValueAtom =
      Atom(name: 'ProfitabilityFormBase.discountValue', context: context);

  @override
  int get discountValue {
    _$discountValueAtom.reportRead();
    return super.discountValue;
  }

  @override
  set discountValue(int value) {
    _$discountValueAtom.reportWrite(value, super.discountValue, () {
      super.discountValue = value;
    });
  }

  late final _$selectedTaxAtom =
      Atom(name: 'ProfitabilityFormBase.selectedTax', context: context);

  @override
  SimpleTaxationSystem get selectedTax {
    _$selectedTaxAtom.reportRead();
    return super.selectedTax;
  }

  @override
  set selectedTax(SimpleTaxationSystem value) {
    _$selectedTaxAtom.reportWrite(value, super.selectedTax, () {
      super.selectedTax = value;
    });
  }

  @override
  String toString() {
    return '''
desiredCostValue: ${desiredCostValue},
discountValue: ${discountValue},
selectedTax: ${selectedTax},
logisticTariff: ${logisticTariff},
logisticBaseCost: ${logisticBaseCost},
logisticCostPerLiter: ${logisticCostPerLiter},
logisticCostForSize: ${logisticCostForSize},
logisticCostForExtraLarge: ${logisticCostForExtraLarge},
paidAcceptanceCost: ${paidAcceptanceCost},
logisticTotalCost: ${logisticTotalCost},
discountedCost: ${discountedCost},
commissionForCost: ${commissionForCost},
totalPayments: ${totalPayments},
taxSize: ${taxSize}
    ''';
  }
}
