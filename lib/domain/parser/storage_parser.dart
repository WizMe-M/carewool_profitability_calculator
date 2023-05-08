import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../database/entity/storage.dart';
import 'excel_parser.dart';
import 'sheet_extensions.dart';

class StorageParser implements ExcelParser<StorageList> {
  final Logger _logger = GetIt.I.get();

  @override
  StorageList? parse(Uint8List bytes) {
    var excel = Excel.decodeBytes(bytes);
    const sheetName = 'Склады';
    var sheet = excel.sheets[sheetName];
    if (sheet == null) {
      _logger.e("Can't find sheet named '$sheetName'!");
      return null;
    }

    var list = StorageList();
    for (var i = 5; i < sheet.maxRows; i++) {
      var storageName = sheet.valueOf<String>(0, i);
      var storage = Storage()..name = storageName;

      var baseLogistic = sheet.valueOf<double>(2, i);
      var additionalLogistic = sheet.valueOf<double>(3, i);
      var logisticTariff = Tariff()
        ..name = 'Логистика'
        ..baseCost = baseLogistic
        ..costPerLiter = additionalLogistic;

      var baseStoring = sheet.valueOf<double>(4, i);
      var additionalStoring = sheet.valueOf<double>(5, i);
      var storingTariff = Tariff()
        ..name = 'Хранение'
        ..baseCost = baseStoring
        ..costPerLiter = additionalStoring;

      var baseAcceptance = sheet.valueOf<double>(9, i);
      var additionalAcceptance = sheet.valueOf<double>(10, i);
      var acceptanceTariff = Tariff()
        ..name = 'Приёмка'
        ..baseCost = baseAcceptance
        ..costPerLiter = additionalAcceptance;

      storage.tariffs
        ..add(logisticTariff)
        ..add(storingTariff)
        ..add(acceptanceTariff);

      list.storages.add(storage);
    }

    return list;
  }
}
