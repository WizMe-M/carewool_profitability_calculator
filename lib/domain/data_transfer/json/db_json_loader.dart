import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import '../../../database/entity/cost_price.dart';
import '../../../database/entity/profitability.dart';
import 'data_to_export_enum.dart';
import 'structure/database_data.dart';

class DbJsonLoader {
  final Isar _isar = GetIt.I.get();
  final Logger _logger = GetIt.I.get();

  void loadImportData(DatabaseData dbData) {
    _isar.writeTxn(() async {
      for (var jsonBlock in dbData.blocks) {
        if (jsonBlock.name == DataToExport.costPriceCalculations.blockName) {
          _logger.i('Started import of cost price calculations');
          _isar.costPrices
              .importJson(jsonBlock.data)
              .then((_) => _logger.i('Cost price import successfully ended'))
              .onError((error, stackTrace) {
            _logger.e('Cost price import failed', error, stackTrace);
          });
        } else if (jsonBlock.name ==
            DataToExport.profitabilityCalculations.blockName) {
          _logger.i('Started import of profitability calculations');
          _isar.profitabilityCalcs
              .importJson(jsonBlock.data)
              .then((_) => _logger.i('Profitability import successfully ended'))
              .onError((error, stackTrace) {
            _logger.e('Profitability import failed', error, stackTrace);
          });
        }
      }
    });
  }
}
