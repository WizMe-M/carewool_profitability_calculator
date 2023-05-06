import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/profitability/logistic_form/logistic_form.dart';
import '../../../../domain/util/symbols.dart';

class LogisticResultWidget extends StatelessWidget {
  final LogisticCalculator logistic;

  const LogisticResultWidget({required this.logistic, super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Стоимость логистики: ${logistic.totalCost}$rubleCurrency',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text('Стоимость за размеры продукции: '
              '${logistic.costForSize} (${logistic.baseCost} + '
              '${logistic.costPerLiter}*'
              '${logistic.sizeForm.overLiterCap})$rubleCurrency'),
          if (logistic.sizeForm.isExtraLargeProduct)
            const Text('Минимальная стоимость для СКГТ: 1000$rubleCurrency'),
        ],
      ),
    );
  }
}
