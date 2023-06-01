import 'dart:convert';
import 'package:get_it/get_it.dart';

import '../../file_dialog/file_dialog.dart';
import '../mime_type_enum.dart';
import 'db_json_loader.dart';
import 'structure/database_data.dart';

class DatabaseImporter {
  final FileDialog _fileDialog = GetIt.I.get();
  final DbJsonLoader _loader = GetIt.I.get();

  Future<DatabaseData?> import() async {
    var file = await _fileDialog.pickFile(MimeType.json);
    if (file == null) return null;

    var jsonString = await file.readAsString();
    var decoded = json.decode(jsonString);
    var map = decoded  as Map<String, dynamic>;
    var dbData = DatabaseData.fromJson(map);

    _loader.loadImportData(dbData);
    return dbData;
  }
}
