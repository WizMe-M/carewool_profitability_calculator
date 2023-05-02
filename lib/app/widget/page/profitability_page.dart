import 'package:auto_route/annotations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'profitability/logistic_form_widget.dart';
import '../side_bar.dart';
import '../../../domain/entity/storage_tariff/storage_tariff.dart';
import '../../../domain/entity/product/product.dart';
import '../../../domain/entity/category/category.dart';
import '../../../domain/parser/excel_parser.dart';

@RoutePage()
class ProfitabilityPage extends StatelessWidget {
  final Logger _logger = GetIt.I.get();
  final Product product;

  ProfitabilityPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор рентабельности')),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Себестоимость: ${product.total}₽'),
                const Text('Дата последнего обновления: 01.05.23'),
                ElevatedButton(
                  onPressed: pickExcelFile,
                  child: const Text('Загрузить Excel-файл с '
                      'тарифами складов и комиссиями'),
                ),
                LogisticFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickExcelFile() async {
    var downloads = await getApplicationDocumentsDirectory();

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      initialDirectory: downloads.path,
      withData: true,
    );
    if (result != null) {
      var file = result.files.single;
      _logger.i('Picked file. Path: "${file.path}"');

      var storageParser = GetIt.I.get<ExcelParser<List<StorageTariff>>>();
      var tariffs = storageParser.parse(file.bytes!);
      if (tariffs.isEmpty) {
        _logger.e('Parsed tariffs data is empty!');
      }

      var categoryParser = GetIt.I.get<ExcelParser<List<Category>>>();
      var categories = categoryParser.parse(file.bytes!);
      if (categories.isEmpty) {
        _logger.e('Parsed categories data is empty!');
      }
    } else {
      _logger.w('File was not picked');
    }
  }
}
