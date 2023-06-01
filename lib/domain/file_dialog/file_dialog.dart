import 'dart:io' as io;
import 'dart:async';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';

import '../data_transfer/file.dart';
import '../data_transfer/mime_type_enum.dart';

class FileDialog {
  Future<DirectoryLocation?> tryPickDirectory() async {
    if (!await FlutterFileDialog.isPickDirectorySupported()) {
      return null;
    }
    return FlutterFileDialog.pickDirectory();
  }

  /// Picks directory and save there file.
  /// Requires [File] with data to save and [MimeType] of file.
  ///
  /// Returns path to saved file or null, if operation was cancelled
  Future<String?> pickDirectoryAndSaveFile(File file, MimeType mimeType) async {
    final directory = await tryPickDirectory();
    if (directory == null) return null;

    return FlutterFileDialog.saveFileToDirectory(
      directory: directory,
      data: file.fileData,
      mimeType: mimeType.name,
      fileName: file.fileName,
      replace: true,
    );
  }

  /// Picks file with [MimeType]s filter.
  ///
  /// Returns picked [io.File]
  Future<io.File?> pickFile([MimeType? mimeType]) async {
    var path = await FlutterFileDialog.pickFile(
      params: OpenFileDialogParams(
        copyFileToCacheDir: true,
        mimeTypesFilter: mimeType?.mimeNames,
        fileExtensionsFilter: mimeType?.extensions,
      ),
    );
    return path != null ? io.File(path) : null;
  }
}
