import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/profitability/profitability_form.dart';
import '../../../../domain/util/symbols.dart';

class CalculationsResultWidget extends StatelessWidget {
  final ProfitabilityForm form;

  const CalculationsResultWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Доход от продажи: ${form.discountedCost}$rubleCurrency'),
          Text(
              'Расходы на производство: ${form.costPrice.total}$rubleCurrency'),
          Text('Расходы на логистику: ${form.logisticTotalCost}$rubleCurrency'),
          Text('Расходы на налог УСН: ${form.taxSize}$rubleCurrency'),
          Text('Итоговые расходы: ${form.expensesWithTax}$rubleCurrency'),
          Text('Прибыль: ${form.profit}$rubleCurrency'),
          Text(
            'Рентабельность: ${form.profitability.toStringAsFixed(2)}%',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
