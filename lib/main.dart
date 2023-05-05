import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import 'app/widget/app.dart';
import 'app/widget/side_bar.dart';
import 'database/database.dart';
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
    ..registerSingletonAsync<Isar>(() => openIsarDatabase())
    ..registerSingletonWithDependencies(() => SideBar(), dependsOn: [Isar])
    ..registerSingleton<ExcelParser<List<StorageTariff>>>(StorageParser())
    ..registerSingleton<ExcelParser<List<Category>>>(CategoryParser());

  logger.i('All dependencies registered');
}
