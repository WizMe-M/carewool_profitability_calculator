import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

abstract class ExcelParser<T> {
  /// Parses data from Excel sheet to [T]
  ///
  /// Value of [bytes] are data from [FilePickerResult]'s excel (.xlsx or .xls) file
  T? parse(Uint8List bytes);
}
