import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../database/entity/commission.dart';
import 'import_excel_status_enum.dart';
import 'parsing/commission_parser.dart';

part 'commission_uploader.g.dart';

class CommissionUploader = CommissionUploaderBase with _$CommissionUploader;

abstract class CommissionUploaderBase with Store {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();
  final CommissionParser _parser = CommissionParser();

  @observable
  CommissionUpload? lastUpload;

  @observable
  ImportExcelStatus status = ImportExcelStatus.notExecuting;

  @computed
  bool get isExecuting {
    return status != ImportExcelStatus.notExecuting &&
        status != ImportExcelStatus.error;
  }

  @action
  Future<void> updateLastUpload() async {
    lastUpload = await _isar.commissionUploads
        .where()
        .sortByUploadTimeDesc()
        .findFirst();
  }

  Future<bool> fetchLastUpload() async {
    await updateLastUpload();
    return lastUpload != null;
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
    var excel = Excel.decodeBytes(file.bytes!);

    var sheetName = excel.getDefaultSheet();
    if (sheetName == null) {
      _logger.e('File has not sheet');
      status = ImportExcelStatus.error;
      return;
    }
    var sheet = excel.sheets[sheetName]!;

    var commissions = _parser.parse(sheet);
    if (commissions == null || commissions.isEmpty) {
      _logger.e('Unable to parse commissions!');
      status = ImportExcelStatus.error;
      return;
    }

    var upload = CommissionUpload()
      ..uploadTime = DateTime.now()
      ..commissions = commissions;
    _isar.writeTxn(() async {
      await _isar.commissionUploads.put(upload);
    }).onError((error, stackTrace) {
      _logger.e('Unable to save commissions upload!', error, stackTrace);
      status = ImportExcelStatus.error;
    });

    status = ImportExcelStatus.notExecuting;
    lastUpload = upload;
  }
}
