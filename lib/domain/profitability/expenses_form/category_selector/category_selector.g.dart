// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_selector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategorySelector on CategorySelectorBase, Store {
  Computed<double>? _$fboCommissionComputed;

  @override
  double get fboCommission =>
      (_$fboCommissionComputed ??= Computed<double>(() => super.fboCommission,
              name: 'CategorySelectorBase.fboCommission'))
          .value;

  late final _$selectedCategoryAtom =
      Atom(name: 'CategorySelectorBase.selectedCategory', context: context);

  @override
  Category? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(Category? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedSubcategoryAtom =
      Atom(name: 'CategorySelectorBase.selectedSubcategory', context: context);

  @override
  Subcategory? get selectedSubcategory {
    _$selectedSubcategoryAtom.reportRead();
    return super.selectedSubcategory;
  }

  @override
  set selectedSubcategory(Subcategory? value) {
    _$selectedSubcategoryAtom.reportWrite(value, super.selectedSubcategory, () {
      super.selectedSubcategory = value;
    });
  }

  late final _$CategorySelectorBaseActionController =
      ActionController(name: 'CategorySelectorBase', context: context);

  @override
  void setSelectedCategory(Category value) {
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
selectedCategory: ${selectedCategory},
selectedSubcategory: ${selectedSubcategory},
fboCommission: ${fboCommission}
    ''';
  }
}
