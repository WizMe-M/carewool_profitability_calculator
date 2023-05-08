import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/excel_upload/excel_parsing_handler.dart';
import '../side_bar.dart';

@RoutePage()
class ExcelUploadPage extends StatelessWidget {
  final _uploader = ExcelUploader();

  ExcelUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор рентабельности')),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                child: Text(
                  'Загрузите Excel-файл с комиссиями по категориям и тарифами '
                  'складов, чтобы мы могли выгрузить из них данные и '
                  'использовать их для расчётов рентабельности',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ElevatedButton(
                onPressed: () async => await _uploader.uploadExcel(),
                child: const Text('Загрузить Excel-файл'),
              ),
              const Text('Дата последнего обновления: 01.05.23'),
              const Spacer(),
              Observer(
                builder: (_) {
                  switch (_uploader.status) {
                    case ParsingStatus.notStarted:
                    case ParsingStatus.done:
                    case ParsingStatus.error:
                      return const SizedBox.shrink();
                    default:
                      return const CircularProgressIndicator();
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
