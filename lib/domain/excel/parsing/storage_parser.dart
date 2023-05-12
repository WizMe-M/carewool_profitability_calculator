import 'package:excel/excel.dart';

import '../../../database/entity/storage.dart';
import 'excel_sheet_parser.dart';
import 'sheet_extensions.dart';

class StorageParser implements ExcelSheetParser<Storage> {
  @override
  List<Storage> parse(Sheet sheet) {
    var list = <Storage>[];
    for (var i = 2; i < sheet.maxRows; i++) {
      var storageName = sheet.valueOf<String>(0, i);
      var storage = Storage()..name = storageName;

      var baseLogistic = sheet.valueOf<double>(1, i);
      var additionalLogistic = sheet.valueOf<double>(2, i);
      var logisticTariff = Tariff()
        ..name = 'Логистика'
        ..baseCost = baseLogistic
        ..costPerLiter = additionalLogistic;

      var baseStoring = sheet.valueOf<double>(6, i);
      var additionalStoring = sheet.valueOf<double>(7, i);
      var storingTariff = Tariff()
        ..name = 'Хранение'
        ..baseCost = baseStoring
        ..costPerLiter = additionalStoring;

      var baseAcceptance = sheet.valueOf<double>(10, i);
      var additionalAcceptance = sheet.valueOf<double>(11, i);
      var acceptanceTariff = Tariff()
        ..name = 'Приёмка'
        ..baseCost = baseAcceptance
        ..costPerLiter = additionalAcceptance;

      storage.tariffs
        ..add(logisticTariff)
        ..add(storingTariff)
        ..add(acceptanceTariff);

      list.add(storage);
    }

    return list;
  }
}
