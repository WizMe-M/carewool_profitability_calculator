import 'package:isar/isar.dart';

import 'upload_base.dart';

part 'storage.g.dart';

@collection
class StorageUpload extends UploadBase<Storage> {}

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
