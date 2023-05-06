import 'package:mobx/mobx.dart';

import '../../../../database/entity/storage.dart';

part 'storage_selector.g.dart';

class StorageSelector = StorageSelectorBase with _$StorageSelector;

abstract class StorageSelectorBase with Store {
  final List<Storage> storages;

  @observable
  bool isInfoExpanded = false;

  @observable
  Storage? selected;

  StorageSelectorBase.withTariffs({required this.storages})
      : selected = storages.first;

  StorageSelectorBase.defaultTariffs()
      : this.withTariffs(storages: <Storage>[
          Storage()
            ..name = 'Базовый тариф'
            ..tariffs = [
              Tariff()
                ..name = 'Логистика'
                ..baseCost = 50
                ..costPerLiter = 5,
              Tariff()
                ..name = 'Хранение'
                ..baseCost = 0.1
                ..costPerLiter = 0.01,
              Tariff()
                ..name = 'Приёмка'
                ..baseCost = 15
                ..costPerLiter = 1.5
            ],
          Storage()
            ..name = 'Чехов 1, Новоселки вл 11 стр 5'
            ..tariffs = [
              Tariff()
                ..name = 'Логистика'
                ..baseCost = 74
                ..costPerLiter = 7.4,
              Tariff()
                ..name = 'Хранение'
                ..baseCost = 0.076
                ..costPerLiter = 0.007,
            ],
        ]);
}
