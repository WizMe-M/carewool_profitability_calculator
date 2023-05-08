import 'package:flutter/material.dart';

import '../../../../domain/profitability/expenses_form/inputs/cost_input.dart';
import '../../../../domain/profitability/expenses_form/inputs/discount_input.dart';

class SalePriceWidget extends StatelessWidget {
  final CostInput desiredCostInput;
  final DiscountInput discountInput;

  const SalePriceWidget({
    required this.desiredCostInput,
    required this.discountInput,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFormField(
          controller: desiredCostInput.controller,
          validator: desiredCostInput.validate,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Цена',
            hintText: 'Введите желаемую цену продажи',
            suffixIcon: const Icon(Icons.currency_ruble),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: discountInput.controller,
          validator: discountInput.validate,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Скидка',
            hintText: 'Введите желаемый размер скидки',
            suffixIcon: const Icon(Icons.percent),
          ),
        ),
      ],
    );
  }
}
