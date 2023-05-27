import 'dart:convert';
import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../file_dialog/file_dialog.dart';
import '../mime_type_enum.dart';
import '../file.dart';

class DatabaseExporter {
  final Logger _logger = GetIt.I.get();
  final FileDialog _fileDialog = GetIt.I.get();

  Future<void> export(Map<String, dynamic> json) async {
    var now = DateFormat('dd.MM.yy HH:mm:ss').format(DateTime.now());
    var fileName = 'carewool-db $now';
    var bytes = Uint8List.fromList(utf8.encode(json.toString()));
    var file = File(json, fileName, bytes);
    _fileDialog.pickDirectoryAndSaveFile(file, MimeType.json).then((path) {
      _logger.i('JSON-file was saved: $path');
    }).onError((error, stackTrace) {
      _logger.e('Unable to save JSON-file', error, stackTrace);
    });
  }
}
