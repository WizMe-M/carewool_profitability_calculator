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

  late final _$productsSnapshotAtom =
      Atom(name: 'ProductRepoStoreBase.productsSnapshot', context: context);

  @override
  ObservableList<RecordSnapshot<int, Map<String, dynamic>>>
      get productsSnapshot {
    _$productsSnapshotAtom.reportRead();
    return super.productsSnapshot;
  }

  @override
  set productsSnapshot(
      ObservableList<RecordSnapshot<int, Map<String, dynamic>>> value) {
    _$productsSnapshotAtom.reportWrite(value, super.productsSnapshot, () {
      super.productsSnapshot = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('ProductRepoStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$saveAsyncAction =
      AsyncAction('ProductRepoStoreBase.save', context: context);

  @override
  Future<void> save(Product product) {
    return _$saveAsyncAction.run(() => super.save(product));
  }

  late final _$removeAsyncAction =
      AsyncAction('ProductRepoStoreBase.remove', context: context);

  @override
  Future<void> remove(int id) {
    return _$removeAsyncAction.run(() => super.remove(id));
  }

  @override
  String toString() {
    return '''
productsSnapshot: ${productsSnapshot},
products: ${products}
    ''';
  }
}
