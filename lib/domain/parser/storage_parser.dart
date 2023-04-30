import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'excel_parser.dart';
import '../entity/storage_tariff/storage_tariff.dart';

class StorageParser implements ExcelParser<List<StorageTariff>> {
  final Logger logger = GetIt.I.get();

  @override
  List<StorageTariff> parse(Uint8List bytes) {
    var excel = Excel.decodeBytes(bytes);
    const sheetName = 'Коэффициент';
    var sheet = excel.sheets[sheetName];
    if (sheet == null) {
      logger.e("Can't find sheet named '$sheetName'!");
      return [];
    }

    var tariffs = <StorageTariff>[];

    for (var i = 5; i < sheet.maxRows; i++) {
      var storageName = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i))
          .value as String;
      var baseLogistic = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i))
          .value as double;
      var additionalLogistic = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i))
          .value as double;
      var baseStoring = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i))
          .value as double;
      var additionalStoring = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i))
          .value as double;
      var baseAcceptance = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: i))
          .value as double;
      var additionalAcceptance = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: i))
          .value as double;

      var tariff = StorageTariff(
        storageName: storageName,
        baseLogistic: baseLogistic,
        additionalLogistic: additionalLogistic,
        baseStoring: baseStoring,
        additionalStoring: additionalStoring,
        baseAcceptance: baseAcceptance,
        additionalAcceptance: additionalAcceptance,
      );

      tariffs.add(tariff);
    }
    return tariffs;
  }
}
