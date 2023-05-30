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

  /// Coeffient of the logistics and storing costs.
  ///
  /// Default value is 100% (as 100)
  late double costCoefficient;

  @Backlink(to: 'storages')
  final IsarLinks<StorageUpload> upload = IsarLinks();

  Storage();

  Storage.withValues(this.name, this.costCoefficient);

  @Index(type: IndexType.value, caseSensitive: false)
  List<String> get nameWords => Isar.splitWords(name);
}
