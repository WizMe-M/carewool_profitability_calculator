// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profitability_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfitabilityForm on ProfitabilityFormBase, Store {
  Computed<double>? _$incomeComputed;

  @override
  double get income =>
      (_$incomeComputed ??= Computed<double>(() => super.income,
              name: 'ProfitabilityFormBase.income'))
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
  Computed<String>? _$incomeFormattedComputed;

  @override
  String get incomeFormatted => (_$incomeFormattedComputed ??= Computed<String>(
          () => super.incomeFormatted,
          name: 'ProfitabilityFormBase.incomeFormatted'))
      .value;
  Computed<String>? _$expenseProductionFormattedComputed;

  @override
  String get expenseProductionFormatted =>
      (_$expenseProductionFormattedComputed ??= Computed<String>(
              () => super.expenseProductionFormatted,
              name: 'ProfitabilityFormBase.expenseProductionFormatted'))
          .value;
  Computed<String>? _$expensesCommissionFormattedComputed;

  @override
  String get expensesCommissionFormatted =>
      (_$expensesCommissionFormattedComputed ??= Computed<String>(
              () => super.expensesCommissionFormatted,
              name: 'ProfitabilityFormBase.expensesCommissionFormatted'))
          .value;
  Computed<String>? _$expensesLogisticsFormattedComputed;

  @override
  String get expensesLogisticsFormatted =>
      (_$expensesLogisticsFormattedComputed ??= Computed<String>(
              () => super.expensesLogisticsFormatted,
              name: 'ProfitabilityFormBase.expensesLogisticsFormatted'))
          .value;
  Computed<String>? _$expensesTaxFormattedComputed;

  @override
  String get expensesTaxFormatted => (_$expensesTaxFormattedComputed ??=
          Computed<String>(() => super.expensesTaxFormatted,
              name: 'ProfitabilityFormBase.expensesTaxFormatted'))
      .value;
  Computed<String>? _$expensesFormattedComputed;

  @override
  String get expensesFormatted => (_$expensesFormattedComputed ??=
          Computed<String>(() => super.expensesFormatted,
              name: 'ProfitabilityFormBase.expensesFormatted'))
      .value;
  Computed<String>? _$expensesWithTaxFormattedComputed;

  @override
  String get expensesWithTaxFormatted => (_$expensesWithTaxFormattedComputed ??=
          Computed<String>(() => super.expensesWithTaxFormatted,
              name: 'ProfitabilityFormBase.expensesWithTaxFormatted'))
      .value;
  Computed<String>? _$profitFormattedComputed;

  @override
  String get profitFormatted => (_$profitFormattedComputed ??= Computed<String>(
          () => super.profitFormatted,
          name: 'ProfitabilityFormBase.profitFormatted'))
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
income: ${income},
expenses: ${expenses},
taxSize: ${taxSize},
expensesWithTax: ${expensesWithTax},
profit: ${profit},
profitability: ${profitability},
incomeFormatted: ${incomeFormatted},
expenseProductionFormatted: ${expenseProductionFormatted},
expensesCommissionFormatted: ${expensesCommissionFormatted},
expensesLogisticsFormatted: ${expensesLogisticsFormatted},
expensesTaxFormatted: ${expensesTaxFormatted},
expensesFormatted: ${expensesFormatted},
expensesWithTaxFormatted: ${expensesWithTaxFormatted},
profitFormatted: ${profitFormatted},
profitabilityFormatted: ${profitabilityFormatted}
    ''';
  }
}
