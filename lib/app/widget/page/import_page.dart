import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/data_transfer/json/database_importer.dart';
import '../side_bar.dart';

@RoutePage()
class ImportPage extends StatelessWidget {
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
                  onPressed: () => _importer.import(),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
