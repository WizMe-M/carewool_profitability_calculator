import 'dart:typed_data';

import '../../../profitability/profitability_form.dart';

class PdfFile {
  final ProfitabilityForm profitabilityForm;
  final String fileName;
  final Uint8List fileData;

  PdfFile(this.profitabilityForm, this.fileName, this.fileData);
}
