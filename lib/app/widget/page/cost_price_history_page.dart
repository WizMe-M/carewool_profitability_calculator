import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../../database/entity/cost_price.dart';
import '../../../domain/cost_price/form/cost_price_form.dart';
import '../../../domain/cost_price/form/edit/edit_wrap.dart';
import '../../../domain/util/strings.dart';
import '../../navigation/app_router.dart';
import '../side_bar.dart';

@RoutePage()
class CostPriceHistoryPage extends StatelessWidget {
  final Isar _isar = GetIt.I.get();

  CostPriceHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Расчеты себестоимости',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              var form = CostPriceForm.defaultTemplate();
              context.router.push(CostCalculatorRoute(form: form));
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
        child: StreamBuilder<List<CostPrice>>(
          stream: _isar.costPrices
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
                      'расчётов себестоимости',
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
                          var form = CostPriceForm.defaultTemplate();
                          context.router.push(CostCalculatorRoute(form: form));
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
                  var costPrice = data[index];
                  var savedDate = DateFormat('dd.MM.yyyy HH:mm')
                      .format(costPrice.savedDate!.toLocal());

                  return ListTile(
                    title: Text(
                      '${costPrice.productName} '
                      '(${costPrice.total}$rubleCurrency)',
                    ),
                    subtitle: Text(savedDate),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: 'Клонировать расчет',
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            var form =
                                CostPriceForm.fromEntity(costPrice: costPrice);
                            context.router
                                .replace(CostCalculatorRoute(form: form));
                          },
                        ),
                        const VerticalDivider(),
                        IconButton(
                          tooltip: 'Удалить расчет',
                          icon: const Icon(Icons.clear),
                          onPressed: () => onRemoveTap(context, costPrice.id!),
                        ),
                      ],
                    ),
                    onTap: () {
                      var editWrap = EditWrap(costPrice: costPrice);
                      context.router.push(
                        EditCostPriceRoute(editWrap: editWrap),
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
    var count = await _isar.costPrices.count();

    if (count > 0) {
      _isar.writeTxn(() async {
        await _isar.costPrices.where().deleteAll();
      });

      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text('Расчёты удалены'),
            duration: Duration(milliseconds: 450),
          ),
        );
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

  void onRemoveTap(BuildContext ctx, int id) {
    _isar.writeTxn(() async {
      await _isar.costPrices.delete(id);
    }).then((value) {
      ScaffoldMessenger.of(ctx)
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
