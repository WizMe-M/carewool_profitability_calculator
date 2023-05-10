import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import '../../app/widget/page/start_new_profitability_page.dart';
import '../../database/entity/cost_price.dart';
import '../../database/entity/upload.dart';
import 'load_error.dart';

/// Loader of data for [StartNewProfitabilityPage]
class DataLoader {
  final Logger _logger = GetIt.I.get();
  final Isar _isar = GetIt.I.get();

  List<CostPrice> costPrices = [];
  Upload? lastUpload;

  /// Fetches data from database asynchronously.
  /// Returns set of errors happened during fetching. Possible errors:
  /// - [LoadError.noSavedCostPrices] - list of cost prices is empty
  /// - [LoadError.missingUpload] - there is no upload of data, that
  /// are necessary for profitability calculations
  Future<Set<LoadError>> fetchData() async {
    var errors = <LoadError>{};

    costPrices = await _isar.costPrices.where().findAll();
    if (costPrices.isEmpty) {
      _logger.w('No saved costs were found');
      errors.add(LoadError.noSavedCostPrices);
    }

    lastUpload = await _isar.uploads.where().sortByUploadTimeDesc().findFirst();
    if (costPrices.isEmpty) {
      _logger.w('No upload was found');
      errors.add(LoadError.missingUpload);
    }

    return errors;
  }
}
