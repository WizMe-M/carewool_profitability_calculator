import 'package:carewool_profitability_calculator/database/application_database.dart';
import 'package:carewool_profitability_calculator/entity/product/product.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast/sembast.dart';

part 'product_repo.g.dart';

class ProductRepoStore = ProductRepoStoreBase with _$ProductRepoStore;

abstract class ProductRepoStoreBase with Store {
  final ApplicationDatabase _db = GetIt.I.get<ApplicationDatabase>();

  @observable
  ObservableList<RecordSnapshot<int, Map<String, dynamic>>> productsSnapshot =
      ObservableList();

  @computed
  ObservableList<Product> get products =>
      ObservableList.of(productsSnapshot.map(
        (snapshot) => Product.fromJson(snapshot.value),
      ))
        ..sort((a, b) => a.creationDate.compareTo(b.creationDate));

  @action
  Future<void> init() async {
    var data = await _db.products.find(_db.client);
    productsSnapshot = ObservableList.of(data);

    _db.products.addOnChangesListener(_db.client, (transaction, changes) async {
      var change = changes.first;
      if (change.isAdd) {
        var data = change.newSnapshot!;
        productsSnapshot.add(data);
      }
      if (change.isDelete) {
        var key = change.oldSnapshot!.key;
        productsSnapshot.removeWhere((element) => element.key == key);
      }
    });
  }

  @action
  Future<void> save(Product product) async {
    await _db.products.add(_db.client, product.toJson());
  }

  @action
  Future<void> remove(int id) async {
    await _db.products.record(id).delete(_db.client);
  }
}
