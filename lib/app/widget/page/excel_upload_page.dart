import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/excel/excel_uploader.dart';
import '../side_bar.dart';
import 'excel_upload/start_upload_widget.dart';
import 'excel_upload/uploading_widget.dart';

@RoutePage()
class ExcelUploadPage extends StatelessWidget {
  final _uploader = ExcelUploader()..fetch();

  ExcelUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Актуализация данных WildBerries',
          style: TextStyle(fontSize: 18),
        ),
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Observer(
                builder: (context) {
                  return _uploader.isFetching
                      ? const LinearProgressIndicator()
                      : const SizedBox.shrink();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                child: Text(
                  'Загрузите данные из Excel-файлов для использования '
                  'их в расчетах рентабельности',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (context) => _uploader.isExecuting
                      ? UploadingWidget(uploader: _uploader)
                      : StartUploadWidget(uploader: _uploader),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
