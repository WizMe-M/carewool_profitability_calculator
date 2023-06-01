import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../domain/profitability/logistics/logistics_calculator.dart';

class LogisticResultWidget extends StatelessWidget {
  final LogisticsCalculator logistics;

  const LogisticResultWidget({required this.logistics, super.key});

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
              'Стоимость логистики: ${logistics.totalCostFormatted}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (logistics.size.isExtraLargeProduct)
              Text(
                '*Минимальная стоимость для СКГТ: '
                '${logistics.minExtraLargeCostFormatted}',
              ),
          ],
        ),
      ),
    );
  }
}
