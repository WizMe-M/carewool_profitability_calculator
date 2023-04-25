import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import '../entity/product/product.dart';
import '../database/repo/product_repository.dart';
import '../navigation/app_router.dart';
import '../viewmodel/calculator/form/calculator_form.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final ProductRepository _repo = GetIt.I.get<ProductRepository>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Observer(
          builder: (context) {
            var snapshots = _repo.productsSnapshot.toList(growable: false);
            var products = _repo.productsSnapshot
                .map((snapshot) => Product.fromJson(snapshot.value))
                .toList(growable: false)
              ..sort((a, b) => a.savedDate.compareTo(b.savedDate));

            if (products.isNotEmpty) {
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var item = products[index];
                  var savedDate = DateFormat('dd.MM.yyyy HH:mm:ss')
                      .format(item.savedDate.toLocal());

                  return ListTile(
                    title: Text('${item.name} (${item.total}₽)'),
                    subtitle: Text(savedDate),
                    trailing: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () async =>
                          await _repo.remove(snapshots[index].key),
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
    var form = CalculatorForm.fromProduct(product: product)..init();
    context.router.replace(CalculatorRoute(form: form));
  }
}
