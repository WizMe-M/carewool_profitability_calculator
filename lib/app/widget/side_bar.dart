import 'package:auto_route/auto_route.dart';
import 'package:carewool_profitability_calculator/domain/cost_price/form/edit/edit_cost_price_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../domain/entity/product/product.dart';
import '../../domain/database/repo/product_repository.dart';
import '../navigation/app_router.dart';
import '../../domain/cost_price/form/cost_price_form.dart';

class SideBar extends StatelessWidget {
  final ProductRepository _repo = GetIt.I.get();
  final Logger _logger = GetIt.I.get();

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Observer(
          builder: (context) {
            Map<int, Product> products;
            try {
              products = _repo.getProducts();
            } on Error catch (error, stackTrace) {
              _logger.e(
                "Failed to get productEntries for productEntries' cost history",
                error,
                stackTrace,
              );
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Произошла ошибка в работе приложения. '
                          'Очистите историю расчетов себестоимости, '
                          'чтобы исправить её.',
                        ),
                        ElevatedButton(
                          onPressed: () async => await _repo.deleteAll(),
                          child: const Text('Очистить историю'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }

            if (products.isNotEmpty) {
              return ListView.builder(
                itemCount: products.length + 1,
                itemBuilder: (context, index) {
                  var i = index - 1;
                  if (i == -1) {
                    return const ListTile(
                      title: Text('Расчёты себестоимости'),
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }

                  var entry = products.entries.elementAt(i);
                  var product = entry.value;
                  var savedDate = DateFormat('dd.MM.yyyy HH:mm')
                      .format(product.savedDate.toLocal());

                  return ListTile(
                    title: Text('${product.name} (${product.total}₽)'),
                    subtitle: Text(savedDate),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: 'Клонировать расчет',
                          icon: const Icon(Icons.copy),
                          onPressed: () => onCopyTap(context, product),
                        ),
                        const VerticalDivider(),
                        IconButton(
                          tooltip: 'Удалить расчет',
                          icon: const Icon(Icons.clear),
                          onPressed: () => onRemoveTap(context, entry.key),
                        ),
                      ],
                    ),
                    onTap: () => onItemTap(context, entry.key, product),
                  );
                },
              );
            } else {
              return const ListTile(
                title: Text(
                  'Нет сохраненных расчётов себестоимости',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Произведите и сохраните хотя бы один '
                    'расчет себестоимости, чтобы просмотреть историю'),
              );
            }
          },
        ),
      ),
    );
  }

  void onCopyTap(BuildContext context, Product product) {
    clearScaffold(context);
    var form = CostPriceForm.fromProduct(product: product);
    context.router.replace(CostCalculatorRoute(form: form));
  }

  Future<void> onRemoveTap(BuildContext context, int id) async {
    clearScaffold(context);
    await _repo.remove(id);
  }

  void onItemTap(BuildContext context, int id, Product product) {
    clearScaffold(context);
    var editWrap = EditWrapCostPriceForm(savedProduct: product, productId: id);
    context.router.push(EditCostPriceRoute(editWrap: editWrap));
  }

  void clearScaffold(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..removeCurrentSnackBar();
  }
}
