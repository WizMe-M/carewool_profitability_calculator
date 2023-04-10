// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_calc_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductFormStore on ProductFormStoreBase, Store {
  Computed<String>? _$nameComputed;

  @override
  String get name => (_$nameComputed ??=
          Computed<String>(() => super.name, name: 'ProductFormStoreBase.name'))
      .value;
  Computed<String>? _$totalComputed;

  @override
  String get total => (_$totalComputed ??= Computed<String>(() => super.total,
          name: 'ProductFormStoreBase.total'))
      .value;
  Computed<bool>? _$nameFilledComputed;

  @override
  bool get nameFilled =>
      (_$nameFilledComputed ??= Computed<bool>(() => super.nameFilled,
              name: 'ProductFormStoreBase.nameFilled'))
          .value;
  Computed<bool>? _$costFilledComputed;

  @override
  bool get costFilled =>
      (_$costFilledComputed ??= Computed<bool>(() => super.costFilled,
              name: 'ProductFormStoreBase.costFilled'))
          .value;
  Computed<bool>? _$canBeSavedComputed;

  @override
  bool get canBeSaved =>
      (_$canBeSavedComputed ??= Computed<bool>(() => super.canBeSaved,
              name: 'ProductFormStoreBase.canBeSaved'))
          .value;
  Computed<String>? _$buttonTextComputed;

  @override
  String get buttonText =>
      (_$buttonTextComputed ??= Computed<String>(() => super.buttonText,
              name: 'ProductFormStoreBase.buttonText'))
          .value;

  late final _$isAppliedAtom =
      Atom(name: 'ProductFormStoreBase.isApplied', context: context);

  @override
  bool get isApplied {
    _$isAppliedAtom.reportRead();
    return super.isApplied;
  }

  @override
  set isApplied(bool value) {
    _$isAppliedAtom.reportWrite(value, super.isApplied, () {
      super.isApplied = value;
    });
  }

  late final _$productNameAtom =
      Atom(name: 'ProductFormStoreBase.productName', context: context);

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  late final _$_totalSumAtom =
      Atom(name: 'ProductFormStoreBase._totalSum', context: context);

  @override
  double get _totalSum {
    _$_totalSumAtom.reportRead();
    return super._totalSum;
  }

  @override
  set _totalSum(double value) {
    _$_totalSumAtom.reportWrite(value, super._totalSum, () {
      super._totalSum = value;
    });
  }

  late final _$ProductFormStoreBaseActionController =
      ActionController(name: 'ProductFormStoreBase', context: context);

  @override
  void calculateTotal() {
    final _$actionInfo = _$ProductFormStoreBaseActionController.startAction(
        name: 'ProductFormStoreBase.calculateTotal');
    try {
      return super.calculateTotal();
    } finally {
      _$ProductFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$ProductFormStoreBaseActionController.startAction(
        name: 'ProductFormStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$ProductFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleButton() {
    final _$actionInfo = _$ProductFormStoreBaseActionController.startAction(
        name: 'ProductFormStoreBase.toggleButton');
    try {
      return super.toggleButton();
    } finally {
      _$ProductFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isApplied: ${isApplied},
productName: ${productName},
name: ${name},
total: ${total},
nameFilled: ${nameFilled},
costFilled: ${costFilled},
canBeSaved: ${canBeSaved},
buttonText: ${buttonText}
    ''';
  }
}
