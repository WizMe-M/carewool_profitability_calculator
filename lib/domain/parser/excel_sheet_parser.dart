import 'package:excel/excel.dart';

abstract class ExcelSheetParser<T> {
  /// Parses data from Excel sheet to [T]
  T? parse(Sheet sheet);
}
