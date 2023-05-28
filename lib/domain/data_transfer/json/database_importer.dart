import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import '../../../database/entity/cost_price.dart';
import '../../../database/entity/profitability.dart';
import '../../file_dialog/file_dialog.dart';
import '../mime_type_enum.dart';
import 'data_to_export_enum.dart';
import 'structure/database_data.dart';

class DatabaseImporter {
  final Isar _isar = GetIt.I.get();
  final Logger _logger = GetIt.I.get();
  final FileDialog _fileDialog = GetIt.I.get();

  Future<void> import() async {
    var file = await _fileDialog.pickFile({MimeType.json});
    if (file == null) return;

    var jsonString = await file.readAsString();
    var map = json.decode(jsonString) as Map<String, dynamic>;
    var dbData = DatabaseData.fromJson(map);

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
  }
}
