import 'package:excel/excel.dart';

import '../../../database/entity/commission.dart';
import 'excel_sheet_parser.dart';
import 'sheet_extensions.dart';

class CommissionParser extends ExcelSheetParser<Commission> {
  @override
  List<Commission> parse(Sheet sheet) {
    var list = <Commission>[];

    for (var i = 1; i < sheet.maxRows; i++) {
      var categoryName = sheet.valueOf<String>(0, i);
      var itemName = sheet.valueOf<String>(1, i);
      var fbo = sheet.valueOf<double>(2, i);
      var fbs = sheet.valueOf<double>(3, i);

      var commission = Commission()
        ..category = categoryName
        ..itemName = itemName
        ..fbo = fbo
        ..fbs = fbs;
      list.add(commission);
    }
    return list;
  }
}
