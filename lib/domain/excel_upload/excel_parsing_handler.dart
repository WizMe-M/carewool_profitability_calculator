import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../../database/entity/storage.dart';
import '../../database/entity/category.dart';
import '../../database/entity/upload.dart';
import '../parser/excel_parser.dart';

part 'excel_parsing_handler.g.dart';

enum ParsingStatus {
  notStarted,
  decodingBytes,
  parsingStorages,
  parsingCategories,
  saving,
  done,
  error,
}

class ExcelParsingHandler = ExcelParsingHandlerBase with _$ExcelParsingHandler;

abstract class ExcelParsingHandlerBase with Store {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();
  final ExcelParser<StorageList> _storageParser = GetIt.I.get();
  final ExcelParser<CategoryList> _categoryParser = GetIt.I.get();

  @observable
  ParsingStatus status = ParsingStatus.notStarted;

  Future<void> handleParsing(Uint8List excelFileBytes) async {
    status = ParsingStatus.parsingStorages;
    var storages = _storageParser.parse(excelFileBytes);
    if (storages == null) {
      _logger.e('Unable to parse storages!');
      status = ParsingStatus.error;
      return;
    }

    status = ParsingStatus.parsingCategories;
    var categories = _categoryParser.parse(excelFileBytes);
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
    }).then((_) {
      status = ParsingStatus.done;
    }).onError((error, stackTrace) {
      _logger.e('Unable to save upload info!', error, stackTrace);
    });
  }
}
