import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../database/entity/cost_price.dart';
import '../../../database/entity/profitability.dart';
import 'data_to_export_enum.dart';
import 'structure/database_data.dart';
import 'structure/json_block.dart';

class DbJsonFactory {
  final Isar _isar = GetIt.I.get();

  Future<Map<String, dynamic>> createDatabaseJsonCopy({
    required Set<DataToExport> toExport,
  }) async {
    var blocks = [
      if (toExport.contains(DataToExport.costPriceCalculations))
        JsonBlock(
          DataToExport.costPriceCalculations.blockName,
          await _isar.costPrices.where().exportJson(),
        ),
      if (toExport.contains(DataToExport.profitabilityCalculations))
        JsonBlock(
          DataToExport.profitabilityCalculations.blockName,
          await _isar.profitabilityCalcs.where().exportJson(),
        )
    ];
    var dbData = DatabaseData(toExport, blocks);
    return dbData.toJson();
  }
}
