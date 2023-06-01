import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../database/entity/commission.dart';
import '../data_transfer/mime_type_enum.dart';
import '../file_dialog/file_dialog.dart';
import 'import_excel_status_enum.dart';
import 'parsing/commission_parser.dart';

part 'commission_uploader.g.dart';

class CommissionUploader = CommissionUploaderBase with _$CommissionUploader;

abstract class CommissionUploaderBase with Store {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();
  final FileDialog _dialog = GetIt.I.get();
  final _parser = CommissionParser();

  @observable
  CommissionUpload? lastUpload;

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
    lastUpload = await _isar.commissionUploads
        .where()
        .sortByUploadTimeDesc()
        .findFirst();
  }

  @action
  Future<void> upload() async {
    status = ImportExcelStatus.downloadingFile;
    var file = await _dialog.pickFile(MimeType.excel);
    if (file == null) {
      _logger.w('File was not picked');
      status = ImportExcelStatus.notExecuting;
      return;
    }

    status = ImportExcelStatus.importing;
    var bytes = await file.readAsBytes();
    var excel = await compute((bytes) => Excel.decodeBytes(bytes), bytes);

    var sheetName = excel.getDefaultSheet();
    if (sheetName == null) {
      _logger.e('File has not sheet');
      status = ImportExcelStatus.error;
      return;
    }
    var sheet = excel.sheets[sheetName]!;

    var commissions = _parser.parse(sheet);
    if (commissions.isEmpty) {
      _logger.e('Unable to parse commissions!');
      status = ImportExcelStatus.error;
      return;
    }

    var upload = CommissionUpload()
      ..fileName = file.path.split('/').last
      ..uploadTime = DateTime.now()
      ..commissions.addAll(commissions);
    _isar.writeTxn(() async {
      await _isar.commissions.putAll(commissions);
      await _isar.commissionUploads.put(upload);
      await upload.commissions.save();
    }).onError((error, stackTrace) {
      _logger.e('Unable to save commissions upload!', error, stackTrace);
      status = ImportExcelStatus.error;
    });

    status = ImportExcelStatus.notExecuting;
    lastUpload = upload;
  }
}
