import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../database/entity/category.dart';
import '../../../../domain/profitability/expenses_form/category_selector/category_selector.dart';

class CategorySelectorWidget extends StatelessWidget {
  final CategorySelector selector;

  const CategorySelectorWidget({required this.selector, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Observer(
            builder: (context) {
              return DropdownButton<Category>(
                value: selector.category,
                onChanged: (selected) => selector.setSelectedCategory(selected),
                items: selector.list.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(
                      category.name!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Observer(
            builder: (_) {
              if (selector.category == null) return const SizedBox.shrink();
              return DropdownButton<Subcategory>(
                value: selector.subcategory,
                onChanged: (selected) => selector.subcategory = selected,
                items: selector.category?.subcategories.map((subcategory) {
                  return DropdownMenuItem<Subcategory>(
                    value: subcategory,
                    child: Text(
                      subcategory.name!,
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Observer(
            builder: (context) {
              return Text('Размер FBS-комиссии ${selector.fbsCommission}%');
            },
          ),
        ],
      ),
    );
  }
}
