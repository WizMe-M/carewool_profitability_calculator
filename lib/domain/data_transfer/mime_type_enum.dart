enum MimeType {
  pdf(['application/pdf'], ['pdf']),
  json(['application/json'], ['json']),
  excel(
    [
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'application/vnd.ms-excel',
    ],
    [
      'xlsx',
      'xls',
    ],
  );

  final List<String> mimeNames;
  final List<String> extensions;

  const MimeType(this.mimeNames, this.extensions);
}
