import 'package:isar/isar.dart';

part 'storage.g.dart';

@collection
class StorageUpload {
  Id? id;

  @Index(unique: true)
  late DateTime uploadTime;

  final IsarLinks<Storage> storages = IsarLinks();
}

@collection
class Storage {
  Id? id;
  String? name;
  List<Tariff> tariffs = [];

  @Backlink(to: 'storages')
  final IsarLinks<StorageUpload> upload = IsarLinks();
}

@embedded
class Tariff {
  String? name;
  double? baseCost;
  double? costPerLiter;
}
