import 'package:isar/isar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'entity/cost_price.dart';

Future<Isar> openIsarDatabase() async {
  final appDocuments = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [CostPriceSchema],
    directory: join(appDocuments.path, 'db'),
  );
  return isar;
}