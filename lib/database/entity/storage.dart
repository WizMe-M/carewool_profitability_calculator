import 'package:isar/isar.dart';

part 'storage.g.dart';

@collection
class StorageList {
  Id? id;
  List<Storage> storages = [];
}

@embedded
class Storage {
  String? name;
  List<Tariff> tariffs = [];
}

@embedded
class Tariff {
  String? name;
  double? baseCost;
  double? costPerLiter;
}
