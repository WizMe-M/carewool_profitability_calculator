import 'package:excel/excel.dart';

abstract class ExcelSheetParser<T> {
  /// Parses data from Excel [Sheet] to [T]
  List<T> parse(Sheet sheet);
}
