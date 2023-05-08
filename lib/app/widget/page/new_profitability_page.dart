import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

import '../../../database/entity/cost_price.dart';
import '../../../database/entity/upload.dart';
import '../../../domain/cost_price/form/cost_price_form.dart';
import '../../../domain/util/symbols.dart';
import '../../navigation/app_router.dart';
import '../side_bar.dart';

@RoutePage()
class NewProfitabilityPage extends StatelessWidget {
  final Isar _isar = GetIt.I.get();

  NewProfitabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Новый расчёт рентабельности'),
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: FutureBuilder(
          future: _isar.costPrices.where().findAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.data!.isEmpty) {
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
              var data = snapshot.data!;
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Выберите расчёт себестоимости, на основании '
                      'которого будет производиться расчёт рентабельности',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.separated(
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
                          trailing: IconButton.outlined(
                            icon: const Icon(Icons.navigate_next),
                            onPressed: () async {
                              var upload = await _isar.uploads
                                  .where()
                                  .sortByUploadTimeDesc()
                                  .findFirst();

                              if (context.mounted) {
                                context.router.push(
                                  ProfitabilityRoute(
                                    costPrice: costPrice,
                                    lastUpload: upload!,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
