import 'dart:typed_data';

import 'package:dfunc/dfunc.dart';
import 'package:excel/excel.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'excel_parser.dart';
import '../entity/category/category.dart';
import '../entity/category_item/category_item.dart';

class CategoryParser implements ExcelParser<List<Category>> {
  final Logger logger = GetIt.I.get();

  @override
  List<Category> parse(Uint8List bytes) {
    var excel = Excel.decodeBytes(bytes);
    const sheetName = 'Логистика, комиссия';
    var sheet = excel.sheets[sheetName];
    if (sheet == null) {
      logger.e("Can't find sheet named '$sheetName'!");
      return [];
    }

    var categories = <Category>[];
    for (var i = 1; i < sheet.maxRows; i++) {
      var categoryName = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i))
          .value as String;
      var category =
          categories.maybeFirstWhere((c) => c.name == categoryName) ??
              Category(name: categoryName, items: []);

      var itemName = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i))
          .value as String;
      var fbo = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i))
          .value as double;
      var fbs = sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i))
          .value as double;

      var item = CategoryItem(name: itemName, fbo: fbo, fbs: fbs);
      category.items.add(item);
    }

    return categories;
  }
}
