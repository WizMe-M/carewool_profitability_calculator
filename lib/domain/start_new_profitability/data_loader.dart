import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import '../../app/widget/page/start_new_profitability_page.dart';
import '../../database/entity/commission.dart';
import '../../database/entity/cost_price.dart';
import '../../database/entity/storage.dart';
import 'load_error_enum.dart';

/// Loader of data for [StartNewProfitabilityPage]
class DataLoader {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();

  List<CostPrice> costPrices = [];
  CommissionUpload? lastCommissionUpload;
  StorageUpload? lastStorageUpload;

  /// Fetches data from database asynchronously.
  /// Returns set of errors happened during fetching. Possible errors:
  /// - [LoadError.noSavedCostPrices] - list of cost prices is empty
  /// - [LoadError.missingStorageUpload] - there is no upload of storages
  /// - [LoadError.missingCommissionUpload] - there is no upload of commissions
  Future<Set<LoadError>> fetchData() async {
    var errors = <LoadError>{};

    costPrices = await _isar.costPrices.where().findAll();
    if (costPrices.isEmpty) {
      _logger.w('No saved costs were found');
      errors.add(LoadError.noSavedCostPrices);
    }

    lastStorageUpload =
        await _isar.storageUploads.where().sortByUploadTimeDesc().findFirst();
    if (lastStorageUpload == null) {
      _logger.w('No storage upload was found');
      errors.add(LoadError.missingStorageUpload);
    }

    lastCommissionUpload = await _isar.commissionUploads
        .where()
        .sortByUploadTimeDesc()
        .findFirst();
    if (lastCommissionUpload == null) {
      _logger.w('No commission upload was found');
      errors.add(LoadError.missingCommissionUpload);
    }

    return errors;
  }
}
