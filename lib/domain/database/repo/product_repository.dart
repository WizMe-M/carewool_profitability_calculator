import 'dart:collection';

import 'package:carewool_profitability_calculator/database/entity/cost_price.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast/sembast.dart';

import '../application_database.dart';
import '../../entity/product/product.dart';
import '../../error/json_to_entitiy_conversion_error.dart';

part 'product_repository.g.dart';

// TODO: remove in case of Isar usage
class ProductRepository = ProductRepositoryBase with _$ProductRepository;

abstract class ProductRepositoryBase with Store {
  final Isar _isar = GetIt.I.get();
  final ApplicationDatabase _db = GetIt.I.get();

  /// Record snapshots of products
  ObservableList<RecordSnapshot<int, Map<String, dynamic>>> _snapshots =
      ObservableList();

  /// Init repository
  ///
  /// Get current data and subscribe to changes
  @action
  Future<void> init() async {
    var data = await _db.products.find(_db.client);
    _snapshots = ObservableList.of(data);

    _db.products.addOnChangesListener(_db.client, (transaction, changes) async {
      for (var change in changes) {
        if (change.isAdd) {
          var added = change.newSnapshot!;
          _snapshots.add(added);
        } else if (change.isUpdate) {
          var key = change.newSnapshot!.key;
          var updated = change.newSnapshot!;
          _snapshots.removeWhere((element) => element.key == key);
          _snapshots.add(updated);
        } else if (change.isDelete) {
          var key = change.oldSnapshot!.key;
          _snapshots.removeWhere((element) => element.key == key);
        }
      }
    });
  }

  /// Receive the map of [Product]s with its ID
  ///
  /// Throws [JsonToEntityConversionError] when it is not available to parse
  /// products from JSON (maybe because of migrating issues)
  UnmodifiableMapView<int, Product> getProducts() {
    Map<int, Product> map;
    try {
      map = {
        for (var snapshot in _snapshots)
          snapshot.key: Product.fromJson(snapshot.value),
      };
    } on TypeError {
      throw JsonToEntityConversionError();
    }
    return UnmodifiableMapView(map);
  }

  /// Add new document with [product] data
  @action
  Future<void> add(Product product) async {
    await _db.products.add(_db.client, product.toJson());
    await _isar.writeTxn(
      () async => await _isar.costPrices.put(product.toEntity()),
    );
  }

  /// Update document under [id] with [product] data
  @action
  Future<void> update(int id, Product product) async {
    await _db.products.record(id).put(_db.client, product.toJson());
  }

  /// Delete document by [id]
  @action
  Future<void> remove(int id) async {
    await _db.products.record(id).delete(_db.client);
    await _isar.writeTxn(
      () async => await _isar.costPrices.delete(id),
    );
  }

  /// Delete all documents
  @action
  Future<void> deleteAll() async {
    await _db.products.delete(_db.client);
    await _isar.writeTxn(
          () async => await _isar.costPrices.buildQuery().deleteAll(),
    );
  }
}
