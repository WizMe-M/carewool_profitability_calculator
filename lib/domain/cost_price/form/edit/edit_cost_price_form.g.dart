// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_cost_price_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditWrapCostPriceForm on EditWrapCostPriceFormBase, Store {
  late final _$formAtom =
      Atom(name: 'EditWrapCostPriceFormBase.form', context: context);

  @override
  CostPriceForm get form {
    _$formAtom.reportRead();
    return super.form;
  }

  @override
  set form(CostPriceForm value) {
    _$formAtom.reportWrite(value, super.form, () {
      super.form = value;
    });
  }

  late final _$EditWrapCostPriceFormBaseActionController =
      ActionController(name: 'EditWrapCostPriceFormBase', context: context);

  @override
  void resetChanges() {
    final _$actionInfo = _$EditWrapCostPriceFormBaseActionController
        .startAction(name: 'EditWrapCostPriceFormBase.resetChanges');
    try {
      return super.resetChanges();
    } finally {
      _$EditWrapCostPriceFormBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
form: ${form}
    ''';
  }
}
