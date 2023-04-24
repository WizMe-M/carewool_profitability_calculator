import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'database/application_database.dart';
import 'entity/product/product.dart';
import 'util/converter/converter_base.dart';
import 'util/converter/product_form_converter.dart';
import 'viewmodel/form/form_block.dart';
import 'viewmodel/form/input.dart';
import 'viewmodel/form/calculator_form.dart';
import 'viewmodel/repo/product_repository.dart';
import 'widget/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _registerDependencies();
  runApp(const App());
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
    ..registerSingleton<CalculatorForm>(
      CalculatorForm(
        blocks: [
          FormBlock(
            title: 'Тара',
            inputs: [
              Input(label: 'Крышка'),
              Input(label: 'Дозатор'),
              Input(label: 'Флакон'),
            ],
          ),
          FormBlock(
            title: 'Упаковка',
            inputs: [
              Input(label: 'Этикетка'),
              Input(label: 'Коробка'),
            ],
          ),
          FormBlock(
            title: 'Производство',
            inputs: [
              Input(label: 'Розлив'),
              Input(label: 'Обклейка'),
            ],
          ),
          FormBlock(
            title: 'Логистика',
            inputs: [
              Input(label: 'Логистика от пр-ва'),
              Input(label: 'Логистика до пр-ва'),
            ],
          ),
        ],
      )..init(),
    );
}
