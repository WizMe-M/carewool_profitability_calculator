import 'package:mobx/mobx.dart';

import 'commission_uploader.dart';
import 'import_excel_status_enum.dart';
import 'storage_uploader.dart';

part 'excel_uploader.g.dart';

class ExcelUploader = ExcelUploaderBase with _$ExcelUploader;

abstract class ExcelUploaderBase with Store {
  final CommissionUploader commissionUploader = CommissionUploader();
  final StorageUploader storageUploader = StorageUploader();

  @observable
  bool isFetching = false;

  @computed
  bool get isExecuting {
    return commissionUploader.isExecuting || storageUploader.isExecuting;
  }

  @computed
  ImportExcelStatus get currentStatus {
    if (commissionUploader.isExecuting) {
      return commissionUploader.status;
    } else if (storageUploader.isExecuting) {
      return storageUploader.status;
    } else {
      return ImportExcelStatus.notExecuting;
    }
  }

  @action
  Future<void> fetch() async {
    isFetching = true;
    await commissionUploader.fetch();
    await storageUploader.fetch();
    isFetching = false;
  }

  @computed
  DateTime? get lastUpdateTime {
    var commission = commissionUploader.lastUpdated;
    var storage = storageUploader.lastUpdated;

    if (commission == null && storage == null) {
      return null;
    } else if (commission == null) {
      return storage;
    } else if (storage == null) {
      return commission;
    } else {
      return commission.compareTo(storage) >= 0 ? commission : storage;
    }
  }
}
