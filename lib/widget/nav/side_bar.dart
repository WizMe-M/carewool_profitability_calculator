import 'package:carewool_profitability_calculator/viewmodel/repo/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class SideBar extends StatelessWidget {
  SideBar({super.key});

  final ProductRepoStore _repo = GetIt.I.get<ProductRepoStore>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Observer(
          builder: (context) {
            var products = _repo.products.toList(growable: false);
            var snapshots = _repo.productsSnapshot.toList(growable: false);
            return products.isNotEmpty
                ? ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var item = products[index];
                      var dateValue = DateFormat('dd.MM.yyyy HH:mm:ss')
                          .format(item.creationDate.toLocal());
                      return ListTile(
                        title: Text('${item.name} (${item.total}₽)'),
                        subtitle: Text(dateValue),
                        trailing: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () async =>
                              await _repo.remove(snapshots[index].key),
                        ),
                      );
                    },
                  )
                : const ListTile(
                    title: Text(
                      'Нет сохраненных продуктов',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('Сохраните хотя бы один расчет, '
                        'чтобы просмотреть историю'),
                  );
          },
        ),
      ),
    );
  }
}
