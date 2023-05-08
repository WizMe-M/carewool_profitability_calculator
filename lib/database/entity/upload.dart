import 'package:isar/isar.dart';

import 'category.dart';
import 'storage.dart';

part 'upload.g.dart';

@collection
class Upload {
  Id? id;
  DateTime? uploadTime;
  IsarLink<CategoryList> categories = IsarLink();
  IsarLink<StorageList> storages = IsarLink();
}