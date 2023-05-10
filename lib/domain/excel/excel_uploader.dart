import 'dart:async';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../database/entity/storage.dart';
import '../../database/entity/category.dart';
import '../../database/entity/upload.dart';
import 'import_excel_status_enum.dart';
import 'parsing/excel_sheet_parser.dart';

part 'excel_uploader.g.dart';

class ExcelUploader = ExcelUploaderBase with _$ExcelUploader;

abstract class ExcelUploaderBase with Store {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();
  final ExcelSheetParser<StorageList> _storageParser = GetIt.I.get();
  final ExcelSheetParser<CategoryList> _categoryParser = GetIt.I.get();

  @observable
  Upload? lastUpload;

  @observable
  ImportExcelStatus status = ImportExcelStatus.notExecuting;

  @computed
  bool get isExecuting =>
      status != ImportExcelStatus.notExecuting && status != ImportExcelStatus.error;

  Future<bool> tryUpdateLastUpload() async {
    await updateLastUpload();
    return lastUpload != null;
  }

  @action
  Future<void> updateLastUpload() async {
    lastUpload = await _isar.uploads.where().sortByUploadTimeDesc().findFirst();
    if (lastUpload == null) {
      _logger.i('No upload was made yet');
    }
  }

  @action
  Future<void> uploadExcel() async {
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

    var categoriesSheet = excel.sheets['Комиссия'];
    if (categoriesSheet == null) {
      _logger.e('Отсутствует страница с комиссиями');
      status = ImportExcelStatus.error;
      return;
    }

    var storagesSheet = excel.sheets['Склады'];
    if (storagesSheet == null) {
      _logger.e('Отсутствует страница со складами');
      status = ImportExcelStatus.error;
      return;
    }

    var storages = _storageParser.parse(storagesSheet);
    if (storages == null) {
      _logger.e('Unable to parse storages!');
      status = ImportExcelStatus.error;
      return;
    }

    var categories = _categoryParser.parse(categoriesSheet);
    if (categories == null) {
      _logger.e('Unable to parse categories!');
      status = ImportExcelStatus.error;
      return;
    }

    var upload = Upload()
      ..uploadTime = DateTime.now()
      ..storages.value = storages
      ..categories.value = categories;
    _isar.writeTxn(() async {
      await _isar.storageLists.put(storages);
      await _isar.categoryLists.put(categories);
      await _isar.uploads.put(upload);
      await upload.storages.save();
      await upload.categories.save();
    }).onError((error, stackTrace) {
      _logger.e('Unable to save upload info!', error, stackTrace);
      status = ImportExcelStatus.error;
    });

    status = ImportExcelStatus.notExecuting;
    lastUpload = upload;
  }
}
