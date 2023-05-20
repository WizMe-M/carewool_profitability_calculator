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

  String get expenseCommission => _format.format(form.commissionForCost);

  String get expenseAcceptance => _format.format(form.paidAcceptanceCost);

  String get expenseTax => _format.format(form.taxSize);

  String get expenseTotal => _format.format(form.expensesWithTax);

  String get profit => _format.format(form.profit);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Доход от продажи: $income$rubleCurrency',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Итоговые расходы: $expenseTotal$rubleCurrency',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '- Расходы на производство: $expenseProduction$rubleCurrency',
          ),
          Text(
            '- Расходы на логистику: $expenseLogistics$rubleCurrency',
          ),
          Text(
            '- Расходы на оплату комиссии: $expenseCommission$rubleCurrency',
          ),
          Text(
            '- Расходы на платную приёмку: $expenseAcceptance$rubleCurrency',
          ),
          Text(
            '- Расходы на налог УСН: $expenseTax$rubleCurrency',
          ),
          Text(
            'Прибыль: $profit$rubleCurrency',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Рентабельность: ${form.profitabilityFormatted}%',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
