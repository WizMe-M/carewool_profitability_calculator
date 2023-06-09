import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'entity/commission.dart';
import 'entity/cost_price.dart';
import 'entity/profitability.dart';
import 'entity/storage.dart';

Future<Isar> openIsarDatabase() async {
  final appDocuments = await getApplicationDocumentsDirectory();
  var path = join(appDocuments.path, 'db');
  await Directory(path).create(recursive: true);

  return Isar.open(
    [
      CostPriceSchema,
      CommissionUploadSchema,
      CommissionSchema,
      StorageUploadSchema,
      StorageSchema,
      ProfitabilityCalcSchema,
    ],
    directory: path,
  );
}
