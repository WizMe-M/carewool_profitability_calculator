import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import 'database/application_database.dart';
import 'entity/product/product.dart';
import 'converter/converter_base.dart';
import 'converter/product_form_converter.dart';
import 'viewmodel/calculator/form/calculator_form.dart';
import 'database/repo/product_repository.dart';
import 'widget/app.dart';

void main() async {
  var binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await _registerDependencies();
  runApp(App());
}

Future<void> _registerDependencies() async {
  await Future.delayed(const Duration(seconds: 5));

  GetIt.instance
    ..registerFactory<ConverterBase<Product, CalculatorForm>>(
        () => ProductFormConverter())
    ..registerSingletonAsync<ApplicationDatabase>(
        () async => ApplicationDatabase().init())
    ..registerSingletonAsync<ProductRepository>(() async {
      var repo = ProductRepository();
      await repo.init();
      return repo;
    }, dependsOn: [ApplicationDatabase])
    ..registerFactory<CalculatorForm>(
      () => CalculatorForm.defaultTemplate()..init(),
    );
}
