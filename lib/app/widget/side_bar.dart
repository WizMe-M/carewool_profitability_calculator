import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../database/entity/cost_price.dart';
import '../../domain/cost_price/form/cost_price_form.dart';
import '../navigation/app_router.dart';

class SideBar extends StatelessWidget {
  final Isar _isar = GetIt.I.get();

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    var costPricesCount = 0;

    var costPricesFuture = Future(() async {
      return costPricesCount = await _isar.costPrices.count();
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
                return snapshot.hasData
                    ? costPricesCount > 0
                        ? Counter(count: costPricesCount)
                        : const SizedBox.shrink()
                    : const CircularProgressIndicator();
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
