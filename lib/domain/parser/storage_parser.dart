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
      var storageName = sheet.valueOf<String>(0, i);
      var baseLogistic = sheet.valueOf<double>(2, i);
      var additionalLogistic = sheet.valueOf<double>(3, i);
      var baseStoring = sheet.valueOf<double>(4, i);
      var additionalStoring = sheet.valueOf<double>(5, i);
      var baseAcceptance = sheet.valueOf<double>(9, i);
      var additionalAcceptance = sheet.valueOf<double>(10, i);

      var tariff = StorageTariff(
        storageName: storageName!,
        baseLogistic: baseLogistic!,
        additionalLogistic: additionalLogistic!,
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

extension on Sheet {
  T? valueOf<T>(int column, int row) {
    var index = CellIndex.indexByColumnRow(columnIndex: column, rowIndex: row);
    var c = cell(index);
    var value = c.value;
    var logger = GetIt.I.get<Logger>()
      ..i('Cell[$column, $row] = $value');

    if (c.isFormula) {
      logger.w('Cell contains formula!');
      // TODO: check on @__xludf.dummyfunction
    } else if (T == String) {
      if (value is SharedString) return value.toString() as T;
      return value as T;
    } else if (value is T) {
      return value;
    }

    return null;
  }
}
