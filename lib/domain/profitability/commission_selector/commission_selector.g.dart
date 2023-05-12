// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_selector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommissionSelector on CommissionSelectorBase, Store {
  Computed<double>? _$fbsCommissionComputed;

  @override
  double get fbsCommission =>
      (_$fbsCommissionComputed ??= Computed<double>(() => super.fbsCommission,
              name: 'CommissionSelectorBase.fbsCommission'))
          .value;
  Computed<double>? _$fboCommissionComputed;

  @override
  double get fboCommission =>
      (_$fboCommissionComputed ??= Computed<double>(() => super.fboCommission,
              name: 'CommissionSelectorBase.fboCommission'))
          .value;

  late final _$selectedAtom =
      Atom(name: 'CommissionSelectorBase.selected', context: context);

  @override
  Commission? get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(Commission? value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected},
fbsCommission: ${fbsCommission},
fboCommission: ${fboCommission}
    ''';
  }
}
