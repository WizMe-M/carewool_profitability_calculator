// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_selector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategorySelector on CategorySelectorBase, Store {
  Computed<double>? _$fbsCommissionComputed;

  @override
  double get fbsCommission =>
      (_$fbsCommissionComputed ??= Computed<double>(() => super.fbsCommission,
              name: 'CategorySelectorBase.fbsCommission'))
          .value;

  late final _$categoryAtom =
      Atom(name: 'CategorySelectorBase.category', context: context);

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$subcategoryAtom =
      Atom(name: 'CategorySelectorBase.subcategory', context: context);

  @override
  Subcategory? get subcategory {
    _$subcategoryAtom.reportRead();
    return super.subcategory;
  }

  @override
  set subcategory(Subcategory? value) {
    _$subcategoryAtom.reportWrite(value, super.subcategory, () {
      super.subcategory = value;
    });
  }

  late final _$CategorySelectorBaseActionController =
      ActionController(name: 'CategorySelectorBase', context: context);

  @override
  void setSelectedCategory(Category? value) {
    final _$actionInfo = _$CategorySelectorBaseActionController.startAction(
        name: 'CategorySelectorBase.setSelectedCategory');
    try {
      return super.setSelectedCategory(value);
    } finally {
      _$CategorySelectorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
subcategory: ${subcategory},
fbsCommission: ${fbsCommission}
    ''';
  }
}
