// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_repo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductRepoStore on ProductRepoStoreBase, Store {
  Computed<ObservableList<Product>>? _$productsComputed;

  @override
  ObservableList<Product> get products => (_$productsComputed ??=
          Computed<ObservableList<Product>>(() => super.products,
              name: 'ProductRepoStoreBase.products'))
      .value;

  late final _$_productsSnapshotAtom =
      Atom(name: 'ProductRepoStoreBase._productsSnapshot', context: context);

  @override
  ObservableList<RecordSnapshot<Object?, Object?>> get _productsSnapshot {
    _$_productsSnapshotAtom.reportRead();
    return super._productsSnapshot;
  }

  @override
  set _productsSnapshot(
      ObservableList<RecordSnapshot<Object?, Object?>> value) {
    _$_productsSnapshotAtom.reportWrite(value, super._productsSnapshot, () {
      super._productsSnapshot = value;
    });
  }

  late final _$ProductRepoStoreBaseActionController =
      ActionController(name: 'ProductRepoStoreBase', context: context);

  @override
  void init() {
    final _$actionInfo = _$ProductRepoStoreBaseActionController.startAction(
        name: 'ProductRepoStoreBase.init');
    try {
      return super.init();
    } finally {
      _$ProductRepoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save(Product product) {
    final _$actionInfo = _$ProductRepoStoreBaseActionController.startAction(
        name: 'ProductRepoStoreBase.save');
    try {
      return super.save(product);
    } finally {
      _$ProductRepoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
