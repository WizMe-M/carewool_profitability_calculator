// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExpensesForm on ExpensesFormBase, Store {
  Computed<double>? _$discountedCostComputed;

  @override
  double get discountedCost =>
      (_$discountedCostComputed ??= Computed<double>(() => super.discountedCost,
              name: 'ExpensesFormBase.discountedCost'))
          .value;
  Computed<double>? _$commissionForCostComputed;

  @override
  double get commissionForCost => (_$commissionForCostComputed ??=
          Computed<double>(() => super.commissionForCost,
              name: 'ExpensesFormBase.commissionForCost'))
      .value;
  Computed<double>? _$taxSizeComputed;

  @override
  double get taxSize =>
      (_$taxSizeComputed ??= Computed<double>(() => super.taxSize,
              name: 'ExpensesFormBase.taxSize'))
          .value;

  late final _$costValueAtom =
      Atom(name: 'ExpensesFormBase.costValue', context: context);

  @override
  double get costValue {
    _$costValueAtom.reportRead();
    return super.costValue;
  }

  @override
  set costValue(double value) {
    _$costValueAtom.reportWrite(value, super.costValue, () {
      super.costValue = value;
    });
  }

  late final _$discountValueAtom =
      Atom(name: 'ExpensesFormBase.discountValue', context: context);

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
      Atom(name: 'ExpensesFormBase.selectedTax', context: context);

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
costValue: ${costValue},
discountValue: ${discountValue},
selectedTax: ${selectedTax},
discountedCost: ${discountedCost},
commissionForCost: ${commissionForCost},
taxSize: ${taxSize}
    ''';
  }
}
