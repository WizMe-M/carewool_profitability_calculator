import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../database/entity/storage.dart';
import '../../database/entity/category.dart';
import '../../database/entity/upload.dart';
import '../parser/excel_sheet_parser.dart';

part 'excel_parsing_handler.g.dart';

enum ParsingStatus {
  notStarted,
  downloadingFile,
  decodingBytes,
  parsingStorages,
  parsingCategories,
  saving,
  done,
  error,
}

class ExcelUploader = ExcelUploaderBase with _$ExcelUploader;

abstract class ExcelUploaderBase with Store {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();
  final ExcelSheetParser<StorageList> _storageParser = GetIt.I.get();
  final ExcelSheetParser<CategoryList> _categoryParser = GetIt.I.get();

  @observable
  ParsingStatus status = ParsingStatus.notStarted;

  @action
  Future<void> uploadExcel() async {
    status = ParsingStatus.downloadingFile;
    var pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      withData: true,
    );
    if (pickedFile == null) {
      _logger.w('File was not picked');
      status = ParsingStatus.notStarted;
      return;
    }

    var file = pickedFile.files.single;
    _logger.i('Picked file. Path: "${file.path}"');

    status = ParsingStatus.decodingBytes;
    var excel = Excel.decodeBytes(file.bytes!);

    var categoriesSheet = excel.sheets['Комиссия'];
    if (categoriesSheet == null) {
      _logger.e('Отсутствует страница с комиссиями');
      status = ParsingStatus.error;
      return;
    }

    var storagesSheet = excel.sheets['Склады'];
    if (storagesSheet == null) {
      _logger.e('Отсутствует страница со складами');
      status = ParsingStatus.error;
      return;
    }

    status = ParsingStatus.parsingStorages;
    var storages = _storageParser.parse(storagesSheet);
    if (storages == null) {
      _logger.e('Unable to parse storages!');
      status = ParsingStatus.error;
      return;
    }

    status = ParsingStatus.parsingCategories;
    var categories = _categoryParser.parse(categoriesSheet);
    if (categories == null) {
      _logger.e('Unable to parse categories!');
      status = ParsingStatus.error;
      return;
    }

    status = ParsingStatus.saving;
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
      status = ParsingStatus.error;
    });
    status = ParsingStatus.done;
  }
}
