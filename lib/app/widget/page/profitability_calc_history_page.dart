import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../../database/entity/profitability.dart';
import '../../../domain/data_transfer/json/data_to_export_enum.dart';
import '../../../domain/data_transfer/json/database_exporter.dart';
import '../../../domain/profitability/profitability_form.dart';
import '../../navigation/app_router.dart';
import '../side_bar.dart';

@RoutePage()
class ProfitabilityCalcHistoryPage extends StatelessWidget {
  final DateFormat _date = DateFormat('dd.MM.yyyy HH:mm');
  final NumberFormat _number = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;

  final DatabaseExporter _exporter = GetIt.I.get();
  final Isar _isar = GetIt.I.get();

  ProfitabilityCalcHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Расчеты рентабельности',
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _exporter.export({DataToExport.profitabilityCalculations});
            },
            icon: const Icon(Icons.download),
            tooltip: 'Экспортировать данные',
          ),
          IconButton(
            onPressed: () {
              context.router.push(StartNewProfitabilityRoute());
            },
            icon: const Icon(Icons.add),
            tooltip: 'Добавить новый расчёт',
          ),
          IconButton(
            onPressed: () => onRemoveAll(context),
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Удалить все расчёты',
          ),
        ],
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: StreamBuilder<List<ProfitabilityCalc>>(
          stream: _isar.profitabilityCalcs
              .where()
              .sortBySavedDateDesc()
              .watch(fireImmediately: true),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (!snapshot.hasData || data!.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      'Нет сохраненных\n'
                      'расчётов рентабельности',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        child: const Text('Добавить новый расчёт'),
                        onPressed: () {
                          context.router.replace(StartNewProfitabilityRoute());
                        },
                      ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              );
            } else {
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  var name = item.costPrice.value?.productName;
                  var percent = _number.format(item.profitability * 100);
                  return ListTile(
                    title: Text('$name ($percent%)'),
                    subtitle: Text(_date.format(item.savedDate)),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: 'Удалить расчет',
                          icon: const Icon(Icons.clear),
                          onPressed: () => onRemoveTap(context, item.id!),
                        ),
                      ],
                    ),
                    onTap: () {
                      context.router.push(
                        ProfitabilityRoute(
                          form: ProfitabilityForm.fromCalc(calc: item),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> onRemoveAll(BuildContext ctx) async {
    var messenger = ScaffoldMessenger.of(ctx);
    var count = await _isar.profitabilityCalcs.count();

    if (count > 0) {
      _isar.writeTxn(() async {
        await _isar.profitabilityCalcs.where().deleteAll();
      }).then((value) {
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Расчёты удалены'),
              duration: Duration(milliseconds: 450),
            ),
          );
      });
    } else {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Отсутствуют расчёты себестоимости'),
            duration: Duration(seconds: 1),
          ),
        );
    }
  }

  void onRemoveTap(BuildContext context, Id id) {
    _isar.writeTxn(() async {
      await _isar.profitabilityCalcs.delete(id);
    }).then((value) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Расчёт удалён'),
            duration: Duration(seconds: 1),
          ),
        );
    });
  }
}
