import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../database/entity/cost_price.dart';
import '../../database/entity/profitability.dart';
import '../../domain/cost_price/form/cost_price_form.dart';
import '../../domain/excel/excel_uploader.dart';
import '../navigation/app_router.dart';

class SideBar extends StatelessWidget {
  final Isar _isar = GetIt.I.get();
  final ExcelUploader _uploader = GetIt.I.get();

  SideBar({super.key});

  Future get costPricesFuture {
    return Future(() async => await _isar.costPrices.count());
  }

  Future get lastUpdateFuture {
    return Future(() async {
      await _uploader.fetch();
      return _uploader.lastUpdateTime;
    });
  }

  Future get profitabilityCalcFuture {
    return Future(() async => await _isar.profitabilityCalcs.count());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.indigo[300]!,
                  Colors.deepPurple[200]!,
                ],
              ),
            ),
            child: const SizedBox(),
          ),
          FutureBuilder(
            future: Future.wait([costPricesFuture, lastUpdateFuture]),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? const SizedBox.shrink()
                  : const LinearProgressIndicator();
            },
          ),
          ListTile(
            leading: const Icon(Icons.upload_file),
            title: const Text('Импортировать данные'),
            onTap: () {
              context.router.push(ImportRoute());
            },
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'Себестоимость',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Добавить новый расчёт'),
            onTap: () {
              var form = CostPriceForm.defaultTemplate();
              context.router.push(CostCalculatorRoute(form: form));
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Сохраненные'),
            trailing: FutureBuilder(
              future: costPricesFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var count = snapshot.data!;
                  return count > 0
                      ? Counter(count: count)
                      : const SizedBox.shrink();
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            onTap: () => context.router.push(CostPriceHistoryRoute()),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'Рентабельность',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
            future: lastUpdateFuture,
            builder: (context, snapshot) {
              return ListTile(
                leading: const Icon(Icons.update),
                title: const Text('Актуализация данных WB'),
                subtitle: snapshot.hasData
                    ? Text('Последнее обновление: '
                        '${DateFormat('dd.MM.yy').format(snapshot.data!)}')
                    : null,
                onTap: () => context.router.push(ExcelUploadRoute()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Добавить новый расчёт'),
            onTap: () => context.router.push(StartNewProfitabilityRoute()),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Сохраненные'),
            trailing: FutureBuilder(
              future: profitabilityCalcFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var count = snapshot.data!;
                  return count > 0
                      ? Counter(count: count)
                      : const SizedBox.shrink();
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            onTap: () => context.router.push(ProfitabilityCalcHistoryRoute()),
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;

  const Counter({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.grey[350],
        width: 20,
        height: 20,
        child: Center(
          child: Text(count.toString(), style: const TextStyle(fontSize: 12)),
        ),
      ),
    );
  }
}
