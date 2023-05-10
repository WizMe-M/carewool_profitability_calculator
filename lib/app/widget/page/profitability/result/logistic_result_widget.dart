import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../domain/util/symbols.dart';
import '../../../../../domain/profitability/profitability_form.dart';

class LogisticResultWidget extends StatelessWidget {
  final ProfitabilityForm profitabilityForm;

  const LogisticResultWidget({required this.profitabilityForm, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Observer(
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Стоимость логистики: ${profitabilityForm.logisticTotalCost}$rubleCurrency',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text('Стоимость за размеры продукции: '
                '${profitabilityForm.logisticCostForSize} (${profitabilityForm.logisticBaseCost} + '
                '${profitabilityForm.logisticCostPerLiter}*'
                '${profitabilityForm.sizeForm.overLiterCap})$rubleCurrency'),
            if (profitabilityForm.sizeForm.isExtraLargeProduct)
              const Text('Минимальная стоимость для СКГТ: 1000$rubleCurrency'),
          ],
        ),
      ),
    );
  }
}
