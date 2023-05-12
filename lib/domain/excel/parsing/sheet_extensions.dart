import 'package:excel/excel.dart';

extension SheetParser on Sheet {
  T? valueOf<T>(int column, int row) {
    var index = CellIndex.indexByColumnRow(columnIndex: column, rowIndex: row);
    var c = cell(index);
    var value = c.value;

    if (c.isFormula) {
      // TODO: check on @__xludf.dummyfunction
    } else if (value is SharedString || value is num) {
      var string = value.toString();
      switch (T) {
        case double:
          return double.tryParse(string.replaceAll(',', '.')) as T?;
        case int:
          return int.tryParse(string) as T?;
        case num:
          return num.tryParse(string) as T?;
        case String:
          return string as T;
      }
    } else if (value is T) {
      return value;
    }

    return null;
  }
}
