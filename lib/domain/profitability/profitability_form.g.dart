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
  Computed<double>? _$logisticTotalCostComputed;

  @override
  double get logisticTotalCost => (_$logisticTotalCostComputed ??=
          Computed<double>(() => super.logisticTotalCost,
              name: 'ProfitabilityFormBase.logisticTotalCost'))
      .value;
  Computed<double>? _$paidAcceptanceCostComputed;

  @override
  double get paidAcceptanceCost => (_$paidAcceptanceCostComputed ??=
          Computed<double>(() => super.paidAcceptanceCost,
              name: 'ProfitabilityFormBase.paidAcceptanceCost'))
      .value;
  Computed<double>? _$priceComputed;

  @override
  double get price => (_$priceComputed ??= Computed<double>(() => super.price,
          name: 'ProfitabilityFormBase.price'))
      .value;
  Computed<double>? _$commissionForCostComputed;

  @override
  double get commissionForCost => (_$commissionForCostComputed ??=
          Computed<double>(() => super.commissionForCost,
              name: 'ProfitabilityFormBase.commissionForCost'))
      .value;
  Computed<double>? _$expensesComputed;

  @override
  double get expenses =>
      (_$expensesComputed ??= Computed<double>(() => super.expenses,
              name: 'ProfitabilityFormBase.expenses'))
          .value;
  Computed<double>? _$taxSizeComputed;

  @override
  double get taxSize =>
      (_$taxSizeComputed ??= Computed<double>(() => super.taxSize,
              name: 'ProfitabilityFormBase.taxSize'))
          .value;
  Computed<double>? _$expensesWithTaxComputed;

  @override
  double get expensesWithTax => (_$expensesWithTaxComputed ??= Computed<double>(
          () => super.expensesWithTax,
          name: 'ProfitabilityFormBase.expensesWithTax'))
      .value;
  Computed<double>? _$profitComputed;

  @override
  double get profit =>
      (_$profitComputed ??= Computed<double>(() => super.profit,
              name: 'ProfitabilityFormBase.profit'))
          .value;
  Computed<double>? _$profitabilityComputed;

  @override
  double get profitability =>
      (_$profitabilityComputed ??= Computed<double>(() => super.profitability,
              name: 'ProfitabilityFormBase.profitability'))
          .value;
  Computed<String>? _$profitabilityFormattedComputed;

  @override
  String get profitabilityFormatted => (_$profitabilityFormattedComputed ??=
          Computed<String>(() => super.profitabilityFormatted,
              name: 'ProfitabilityFormBase.profitabilityFormatted'))
      .value;

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
selectedTax: ${selectedTax},
logisticTariff: ${logisticTariff},
logisticBaseCost: ${logisticBaseCost},
logisticCostPerLiter: ${logisticCostPerLiter},
logisticCostForSize: ${logisticCostForSize},
logisticCostForExtraLarge: ${logisticCostForExtraLarge},
logisticTotalCost: ${logisticTotalCost},
paidAcceptanceCost: ${paidAcceptanceCost},
price: ${price},
commissionForCost: ${commissionForCost},
expenses: ${expenses},
taxSize: ${taxSize},
expensesWithTax: ${expensesWithTax},
profit: ${profit},
profitability: ${profitability},
profitabilityFormatted: ${profitabilityFormatted}
    ''';
  }
}
