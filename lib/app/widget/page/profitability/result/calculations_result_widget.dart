import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/profitability/profitability_form.dart';
import '../../../../../domain/util/symbols.dart';

class CalculationsResultWidget extends StatelessWidget {
  final NumberFormat _format = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;
  final ProfitabilityForm form;

  CalculationsResultWidget({required this.form, super.key});

  String get income => _format.format(form.price);

  String get expenseProduction => _format.format(form.costPrice.total);

  String get expenseLogistics => _format.format(form.logisticTotalCost);

  String get expenseTax => _format.format(form.taxSize);

  String get expenseTotal => _format.format(form.expensesWithTax);

  String get profit => _format.format(form.profit);

  String get profitability => _format.format(form.profitability);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Доход от продажи: $income$rubleCurrency'),
          Text('Расходы на производство: $expenseProduction$rubleCurrency'),
          Text('Расходы на логистику: $expenseLogistics$rubleCurrency'),
          Text('Расходы на налог УСН: $expenseTax$rubleCurrency'),
          Text('Итоговые расходы: $expenseTotal$rubleCurrency'),
          Text('Прибыль: $profit$rubleCurrency'),
          Text(
            'Рентабельность: $profitability%',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
