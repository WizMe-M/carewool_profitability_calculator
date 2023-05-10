import 'package:dfunc/dfunc.dart';
import 'package:excel/excel.dart';

import '../../../database/entity/category.dart';
import 'excel_sheet_parser.dart';
import 'sheet_extensions.dart';

class CategoryParser implements ExcelSheetParser<CategoryList> {
  @override
  CategoryList? parse(Sheet sheet) {
    var list = CategoryList();
    for (var i = 1; i < sheet.maxRows; i++) {
      var categoryName = sheet.valueOf<String>(0, i);
      var category =
          list.categories.maybeFirstWhere((e) => e.name == categoryName);
      if (category == null) {
        category = Category()
          ..name = categoryName
          ..subcategories = [];
        list.categories.add(category);
      }

      var subcategoryName = sheet.valueOf<String>(1, i);
      var fbo = sheet.valueOf<double>(3, i);
      var fbs = sheet.valueOf<double>(4, i);

      var subcategory = Subcategory()
        ..name = subcategoryName
        ..fbo = fbo
        ..fbs = fbs;
      category.subcategories.add(subcategory);
    }

    return list;
  }
}
