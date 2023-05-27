import 'dart:async';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../data_transfer/file.dart';
import '../data_transfer/mime_type_enum.dart';

class FileDialog {
  final Logger _logger = GetIt.I.get();

  Future<DirectoryLocation?> tryPickDirectory() async {
    if (!await FlutterFileDialog.isPickDirectorySupported()) {
      _logger.e('Picking directory not supported');
      return null;
    }
    return FlutterFileDialog.pickDirectory();
  }

  Future<void> pickDirectoryAndSaveFile(
    File file,
    MimeType mimeType, {
    required FutureOr<void> Function(dynamic value) onSuccess,
    required FutureOr<void> Function(Object error, StackTrace stackTrace)
        onError,
  }) async {
    final directory = await tryPickDirectory();
    if (directory == null) return;

    FlutterFileDialog.saveFileToDirectory(
      directory: directory,
      data: file.fileData,
      mimeType: mimeType.name,
      fileName: file.fileName,
      replace: true,
    ).then(onSuccess).onError(onError);
  }
}
