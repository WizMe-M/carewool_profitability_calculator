import 'dart:convert';
import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../file_dialog/file_dialog.dart';
import '../mime_type_enum.dart';
import '../file.dart';
import 'data_to_export_enum.dart';
import 'db_json_factory.dart';

class DatabaseExporter {
  final DbJsonFactory _factory = GetIt.I.get();
  final Logger _logger = GetIt.I.get();
  final FileDialog _fileDialog = GetIt.I.get();
  final _date = DateFormat('dd.MM.yy HH:mm:ss');

  Future<void> export(Set<DataToExport> toExport) async {
    var jsonCopy = _factory.createDatabaseJsonCopy(toExport: toExport);
    var bytes = Uint8List.fromList(utf8.encode(jsonCopy.toString()));

    var now = _date.format(DateTime.now());
    var fileName = 'carewool-db $now';
    var file = File(jsonCopy, fileName, bytes);

    _fileDialog.pickDirectoryAndSaveFile(file, MimeType.json).then((path) {
      _logger.i('JSON-file was saved: $path');
    }).onError((error, stackTrace) {
      _logger.e('Unable to save JSON-file', error, stackTrace);
    });
  }
}
