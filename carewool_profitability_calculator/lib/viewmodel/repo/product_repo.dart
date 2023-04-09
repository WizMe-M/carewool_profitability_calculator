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
  ObservableList<RecordSnapshot> _productsSnapshot = ObservableList();

  @computed
  ObservableList<Product> get products =>
      ObservableList.of(_productsSnapshot.map(
        (snapshot) => Product.fromJson(snapshot.value as Map<String, dynamic>),
      ));

  @action
  void init() {
    _db.products.addOnChangesListener(_db.client, (transaction, changes) async {
      var list = await _db.products.query().getSnapshots(_db.client);
      _productsSnapshot = ObservableList.of(list);
    });
  }

  @action
  void save(Product product) {
    _db.products.add(_db.client, product.toJson());
  }
}
