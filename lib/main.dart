import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'database/application_database.dart';
import 'viewmodel/cost_calculator/form/cost_calculator_form.dart';
import 'database/repo/product_repository.dart';
import 'widget/app.dart';

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
    ..registerFactory<CostCalculatorForm>(
      () => CostCalculatorForm.defaultTemplate()..init(),
    );

  logger.i('All dependencies registered');
}
