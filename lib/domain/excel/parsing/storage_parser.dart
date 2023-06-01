import 'package:excel/excel.dart';

import '../../../database/entity/storage.dart';
import 'excel_sheet_parser.dart';
import 'sheet_extensions.dart';

class StorageParser implements ExcelSheetParser<Storage> {
  @override
  List<Storage> parse(Sheet sheet) {
    var list = <Storage>[];
    for (var i = 1; i < sheet.maxRows; i++) {
      var storageName = sheet.valueOf<String>(0, i);
      var costCoefficient = sheet.valueOf<double>(1, i);

      if (storageName == null) continue;
      var storage = Storage.withValues(storageName, costCoefficient ?? 100);
      list.add(storage);
    }

    return list;
  }
}
