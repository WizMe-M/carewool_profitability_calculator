import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../database/entity/cost_price.dart';
import '../../domain/cost_price/form/cost_price_form.dart';
import '../../domain/excel_upload/excel_parsing_handler.dart';
import '../navigation/app_router.dart';

class SideBar extends StatelessWidget {
  final Isar _isar = GetIt.I.get();
  final ExcelUploader _uploader = GetIt.I.get();

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    var costPricesFuture = Future(() async {
      await Future.delayed(const Duration(seconds: 1));
      return await _isar.costPrices.count();
    });

    var lastUpdateFuture = Future(() async {
      await Future.delayed(const Duration(seconds: 1));
      var lastUploadExist = await _uploader.updateLastUpload();
      if (lastUploadExist) {
        return _uploader.lastUpload!.uploadTime;
      } else {
        return null;
      }
    });

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
            future: Future.wait([costPricesFuture]),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? const SizedBox.shrink()
                  : const LinearProgressIndicator();
            },
          ),
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
              if (snapshot.hasData) {
                var updated = DateFormat('dd.MM.yy').format(snapshot.data!);
                return ListTile(
                  leading: const Icon(Icons.update),
                  title: const Text('Загрузить Excel'),
                  subtitle: Text('Последнее обновление: $updated'),
                  onTap: () => context.router.push(ExcelUploadRoute()),
                );
              } else {
                return ListTile(
                  leading: const Icon(Icons.update),
                  title: const Text('Загрузить Excel'),
                  onTap: () => context.router.push(ExcelUploadRoute()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Добавить новый расчёт'),
            onTap: () => context.router.push(NewProfitabilityRoute()),
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
