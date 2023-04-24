import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast/sembast.dart';

import '../../database/application_database.dart';
import '../../entity/product/product.dart';

part 'product_repository.g.dart';

class ProductRepository = ProductRepositoryBase with _$ProductRepository;

abstract class ProductRepositoryBase with Store {
  final ApplicationDatabase _db = GetIt.I.get<ApplicationDatabase>();

  /// Список со всеми сохраненными расчетами
  @observable
  ObservableList<RecordSnapshot<int, Map<String, dynamic>>> productsSnapshot =
      ObservableList();

  /// Инициализировать репозиторий
  ///
  /// Получает сохраненные ранее расчеты и
  /// подписывается на изменения в базе данных
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

  /// Сохранить продукцию в базе данных
  @action
  Future<void> save(Product product) async {
    await _db.products.add(_db.client, product.toJson());
  }

  /// Удалить продукцию в базе данных по ID
  @action
  Future<void> remove(int id) async {
    await _db.products.record(id).delete(_db.client);
  }
}
