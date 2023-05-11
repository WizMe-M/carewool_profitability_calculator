import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../database/entity/commission.dart';
import '../../../../../domain/profitability/commission_selector/commission_selector.dart';

class CategorySelectorWidget extends StatelessWidget {
  final CommissionSelector selector;

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
              return DropdownButton<Commission>(
                value: selector.selected,
                onChanged: (selected) => selector.selected =selected,
                items: selector.list.map((commission) {
                  return DropdownMenuItem<Commission>(
                    value: commission,
                    child: Text(
                      '${commission.itemName} / ${commission.category}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Observer(
              builder: (context) {
                return Text('Размер FBS-комиссии ${selector.fbsCommission}%');
              },
            ),
          ),
        ],
      ),
    );
  }
}
