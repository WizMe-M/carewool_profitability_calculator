import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../domain/data_transfer/json/database_importer.dart';
import '../side_bar.dart';

@RoutePage()
class ImportPage extends StatelessWidget {
  final Logger _logger = GetIt.I.get();
  final DatabaseImporter _importer = GetIt.I.get();

  ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Импорт', style: TextStyle(fontSize: 18)),
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                child: Text(
                  'Импортируйте в базу данных данные из JSON-файлов\n'
                  '(carewool-db dd.mm.yy HH:mm:ss.json)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('Загрузить файл'),
                  onPressed: () => importData(context),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> importData(BuildContext context) async {
    var messenger = ScaffoldMessenger.of(context);
    _importer.import().then((dbData) {
      if (dbData == null) return;
      messenger.showSnackBar(SnackBar(
        content: Text('Успешный импорт.\n${dbData.getInfo()}'),
        duration: const Duration(seconds: 2),
      ));
    }).onError((error, stackTrace) {
      _logger.e('Unable to import data', error, stackTrace);
      messenger.showSnackBar(const SnackBar(
        content: Text('Произошла ошибка во время импорта...'),
        duration: Duration(seconds: 2),
      ));
    });
  }
}
