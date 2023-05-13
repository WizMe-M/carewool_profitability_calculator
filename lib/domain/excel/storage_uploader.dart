import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../database/entity/storage.dart';
import 'import_excel_status_enum.dart';
import 'parsing/storage_parser.dart';

part 'storage_uploader.g.dart';

class StorageUploader = StorageUploaderBase with _$StorageUploader;

abstract class StorageUploaderBase with Store {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();
  final StorageParser _parser = StorageParser();

  @observable
  StorageUpload? lastUpload;

  @observable
  ImportExcelStatus status = ImportExcelStatus.notExecuting;

  @computed
  DateTime? get lastUpdated => lastUpload?.uploadTime;

  @computed
  bool get isExecuting {
    return status != ImportExcelStatus.notExecuting &&
        status != ImportExcelStatus.error;
  }

  @action
  Future<void> fetch() async {
    lastUpload =
        await _isar.storageUploads.where().sortByUploadTimeDesc().findFirst();
  }

  @action
  Future<void> upload() async {
    status = ImportExcelStatus.downloadingFile;
    var pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      withData: true,
    );

    if (pickedFile == null) {
      _logger.w('File was not picked');
      status = ImportExcelStatus.notExecuting;
      return;
    }

    var file = pickedFile.files.single;
    _logger.i('Picked file. Path: "${file.path}"');

    status = ImportExcelStatus.importing;
    var excel = await compute((bytes) => Excel.decodeBytes(bytes), file.bytes!);

    var sheetName = excel.getDefaultSheet();
    if (sheetName == null) {
      _logger.e('File has not sheet');
      status = ImportExcelStatus.error;
      return;
    }
    var sheet = excel.sheets[sheetName]!;

    var storages = _parser.parse(sheet);
    if (storages.isEmpty) {
      _logger.e('Unable to parse storages!');
      status = ImportExcelStatus.error;
      return;
    }

    var upload = StorageUpload()
      ..fileName = file.name
      ..uploadTime = DateTime.now()
      ..storages.addAll(storages);
    _isar.writeTxn(() async {
      await _isar.storages.putAll(storages);
      await _isar.storageUploads.put(upload);
      await upload.storages.save();
    }).onError((error, stackTrace) {
      _logger.e('Unable to save storages upload!', error, stackTrace);
      status = ImportExcelStatus.error;
    });

    status = ImportExcelStatus.notExecuting;
    lastUpload = upload;
  }
}
