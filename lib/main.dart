import 'package:carewool_profitability_calculator/database/application_database.dart';
import 'package:carewool_profitability_calculator/entity/product/product.dart';
import 'package:carewool_profitability_calculator/util/converter/converter_base.dart';
import 'package:carewool_profitability_calculator/util/converter/product_form_converter.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/form_block.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/input.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/calculator_form.dart';
import 'package:carewool_profitability_calculator/viewmodel/repo/product_repository.dart';
import 'package:carewool_profitability_calculator/widget/app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
