import 'package:carewool_profitability_calculator/domain/data_transfer/json/database_exporter.dart';
import 'package:carewool_profitability_calculator/domain/data_transfer/json/database_importer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import 'app/widget/app.dart';
import 'app/widget/side_bar.dart';
import 'database/database.dart';
import 'domain/data_transfer/export/pdf/profitability_pdf_creator.dart';
import 'domain/data_transfer/json/db_json_factory.dart';
import 'domain/excel/excel_uploader.dart';
import 'domain/file_dialog/file_dialog.dart';

void main() async {
  var binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  _registerDependencies();
  runApp(App());
}

void _registerDependencies() {
  var logger = Logger(printer: PrettyPrinter(printEmojis: false));

  GetIt.instance
    ..registerSingletonAsync<ProfitabilityPdfCreator>(
      () => ProfitabilityPdfCreator.init(),
    )
    ..registerSingletonAsync<Isar>(() => openIsarDatabase())
    ..registerSingleton(logger)
    ..registerSingleton(FileDialog())
    ..registerSingletonWithDependencies(
      () => DbJsonFactory(),
      dependsOn: [Isar],
    )
    ..registerSingletonWithDependencies(
      () => DatabaseExporter(),
      dependsOn: [DbJsonFactory],
    )
    ..registerSingletonWithDependencies(
      () => DatabaseImporter(),
      dependsOn: [Isar],
    )
    ..registerSingletonWithDependencies(
      () => ExcelUploader(),
      dependsOn: [Isar],
    )
    ..registerSingletonWithDependencies(
      () => SideBar(),
      dependsOn: [Isar],
    );

  logger.i('All dependencies registered');
}
