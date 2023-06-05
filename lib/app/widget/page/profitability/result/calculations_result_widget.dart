import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../domain/profitability/profitability_form.dart';

class CalculationsResultWidget extends StatelessWidget {
  final ProfitabilityForm form;

  const CalculationsResultWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (context) {
          return Text(
            'Доход от продажи: ${form.incomeFormatted}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          );
        }),
        Observer(builder: (context) {
          return Text(
            'Итоговые расходы: ${form.expensesWithTaxFormatted}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          );
        }),
        Observer(builder: (context) {
          return Text(
            '- Расходы на производство: ${form.expenseProductionFormatted}',
          );
        }),
        Observer(builder: (context) {
          return Text(
            '- Расходы на логистику: ${form.expensesLogisticsFormatted}',
          );
        }),
        Observer(builder: (context) {
          return Text(
            '- Расходы на оплату комиссии: ${form.expensesCommissionFormatted}',
          );
        }),
        Observer(builder: (context) {
          return Text(
            '- Расходы на налог УСН: ${form.expensesTaxFormatted}',
          );
        }),
        Observer(builder: (context) {
          return Text(
            'Прибыль: ${form.profitFormatted}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          );
        }),
        Observer(builder: (context) {
          return Text(
            'Рентабельность: ${form.profitabilityFormatted}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          );
        }),
      ],
    );
  }
}
