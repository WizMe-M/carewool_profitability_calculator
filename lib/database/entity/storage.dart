import 'package:isar/isar.dart';

part 'storage.g.dart';

@collection
class StorageUpload {
  Id? id;
  late String fileName;

  @Index(unique: true)
  late DateTime uploadTime;

  final IsarLinks<Storage> storages = IsarLinks();
}

@collection
class Storage {
  Id? id;
  late String name;
  late List<Tariff> tariffs = [];

  @Backlink(to: 'storages')
  final IsarLinks<StorageUpload> upload = IsarLinks();

  Storage();

  Storage.withValues(this.name, this.tariffs);

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get nameWords => Isar.splitWords(name);
}

@embedded
class Tariff {
  late String name;
  late double baseCost;
  late double costPerLiter;

  Tariff();

  Tariff.withValues(this.name, this.baseCost, this.costPerLiter);
}
