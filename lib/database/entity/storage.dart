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
  String? name;
  List<Tariff> tariffs = [];

  @Backlink(to: 'storages')
  final IsarLinks<StorageUpload> upload = IsarLinks();

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get nameWords => Isar.splitWords(name!);
}

@embedded
class Tariff {
  String? name;
  double? baseCost;
  double? costPerLiter;
}
