import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'app/viewmodel/cost_price/form/cost_price_form.dart';
import 'app/widget/app.dart';
import 'domain/database/application_database.dart';
import 'domain/database/repo/product_repository.dart';
import 'domain/entity/category/category.dart';
import 'domain/entity/storage_tariff/storage_tariff.dart';
import 'domain/parser/category_parser.dart';
import 'domain/parser/excel_parser.dart';
import 'domain/parser/storage_parser.dart';

void main() async {
  var binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await _registerDependencies();
  runApp(App());
}

Future<void> _registerDependencies() async {
  var logger = Logger(printer: PrettyPrinter(printEmojis: false));

  GetIt.instance
    ..registerSingleton<Logger>(logger)
    ..registerSingletonAsync<ApplicationDatabase>(
        () async => ApplicationDatabase().init())
    ..registerSingletonAsync<ProductRepository>(() async {
      var repo = ProductRepository();
      await repo.init();
      return repo;
    }, dependsOn: [ApplicationDatabase])
    ..registerFactory<CostPriceForm>(
      () => CostPriceForm.defaultTemplate()..init(),
    )
    ..registerSingleton<ExcelParser<List<StorageTariff>>>(StorageParser())
    ..registerSingleton<ExcelParser<List<Category>>>(CategoryParser());

  logger.i('All dependencies registered');
}
