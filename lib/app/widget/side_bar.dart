import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../domain/entity/product/product.dart';
import '../../domain/database/repo/product_repository.dart';
import '../navigation/app_router.dart';
import '../viewmodel/cost_calculator/form/cost_calculator_form.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final ProductRepository _repo = GetIt.I.get<ProductRepository>();
  final Logger _logger = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Observer(
          builder: (context) {
            Map<int, Product> products;
            try {
              products = _repo.getProducts();
            } on Error catch (e, s) {
              _logger.e(
                  "Failed to get products for products' cost history", e, s);
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                            "Error happened. It's recommended to clear saved cost calculations"),
                        ElevatedButton(
                          onPressed: () async => await _repo.deleteAll(),
                          child: const Text('Clear all'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }

            if (products.isNotEmpty) {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var key = products.keys.elementAt(index);
                  var item = products[key]!;
                  var savedDate = DateFormat('dd.MM.yyyy HH:mm:ss')
                      .format(item.savedDate.toLocal());

                  return ListTile(
                    title: Text('${item.name} (${item.total}₽)'),
                    subtitle: Text(savedDate),
                    trailing: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => onRemoveTap(context, key),
                    ),
                    onTap: () => onCostTap(context, item),
                  );
                },
              );
            } else {
              return const ListTile(
                title: Text(
                  'Нет сохраненных продуктов',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text('Сохраните хотя бы один расчет, '
                    'чтобы просмотреть историю'),
              );
            }
          },
        ),
      ),
    );
  }

  void onCostTap(BuildContext context, Product product) {
    clearScaffold(context);
    var form = CostCalculatorForm.fromProduct(product: product)..init();
    context.router.replace(CostCalculatorRoute(form: form));
  }

  Future<void> onRemoveTap(BuildContext context, int id) async {
    clearScaffold(context);
    await _repo.remove(id);
  }

  void clearScaffold(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..removeCurrentSnackBar();
  }
}
