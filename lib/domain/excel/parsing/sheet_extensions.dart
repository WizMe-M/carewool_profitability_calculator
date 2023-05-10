import 'package:excel/excel.dart';

extension SheetParser on Sheet {
  T? valueOf<T>(int column, int row) {
    var index = CellIndex.indexByColumnRow(columnIndex: column, rowIndex: row);
    var c = cell(index);
    var value = c.value;

    if (c.isFormula) {
      // TODO: check on @__xludf.dummyfunction
    } else if (T == String) {
      if (value is SharedString) return value.toString() as T;
      return value as T;
    } else if (value is T) {
      return value;
    } else if (value is num) {
      switch (T) {
        case double:
          return value.toDouble() as T;
        case int:
          return value.toInt() as T;
        case num:
          return value as T;
      }
    }

    return null;
  }
}
