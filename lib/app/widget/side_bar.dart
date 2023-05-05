import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../database/entity/cost_price.dart';
import '../navigation/app_router.dart';

class SideBar extends StatelessWidget {
  final Isar _isar = GetIt.I.get();

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    var costPricesCount = 0;
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
            future: Future.wait([
              Future(() async {
                return costPricesCount = await _isar.costPrices.count();
              }),
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  title: const Text('Расчёты себестоимости'),
                  leading: const Icon(Icons.currency_ruble),
                  trailing: costPricesCount > 0
                      ? Counter(count: costPricesCount)
                      : null,
                  onTap: () async {
                    clearScaffold(context);
                    context.router.push(CostPriceHistoryRoute());
                  },
                );
              } else {
                return const LinearProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }

  void clearScaffold(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..removeCurrentSnackBar();
  }
}

class Counter extends StatelessWidget {
  final int count;

  const Counter({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.grey,
        width: 20,
        height: 20,
        child: Center(
          child: Text(count.toString(), style: const TextStyle(fontSize: 12)),
        ),
      ),
    );
  }
}
