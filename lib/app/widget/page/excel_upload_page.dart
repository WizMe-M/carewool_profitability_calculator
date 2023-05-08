import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

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
              Observer(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: _uploader.isExecuting
                        ? null
                        : () async => await _uploader.uploadExcel(),
                    child: const Text('Загрузить Excel-файл'),
                  );
                },
              ),
              FutureBuilder(
                future: _uploader.updateLastUpload(),
                builder: (_, snapshot) {
                  return snapshot.hasData
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(),
                        );
                },
              ),
              Observer(
                builder: (context) {
                  var upload = _uploader.lastUpload;
                  if (upload != null) {
                    var uploadedAt = DateFormat('dd.MM.yy HH:mm:ss')
                        .format(upload.uploadTime!);
                    return Text(
                      'Дата последнего обновления:\n$uploadedAt',
                      textAlign: TextAlign.center,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const Spacer(),
              Observer(
                builder: (_) {
                  return _uploader.isExecuting
                      ? const CircularProgressIndicator()
                      : const SizedBox.shrink();
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
