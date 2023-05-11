import 'dart:io';

import 'entity/category.dart';
import 'entity/commission.dart';
import 'entity/storage.dart';
import 'entity/upload.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'entity/cost_price.dart';

Future<Isar> openIsarDatabase() async {
  final appDocuments = await getApplicationDocumentsDirectory();
  var path = join(appDocuments.path, 'db');
  Directory(path).createSync(recursive: true);

  final isar = await Isar.open(
    [
      CostPriceSchema,
      StorageListSchema,
      CategoryListSchema,
      CommissionUploadSchema,
      UploadSchema,
    ],
    directory: path,
  );
  return isar;
}
