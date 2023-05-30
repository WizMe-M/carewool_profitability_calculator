import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../domain/profitability/pricing/pricing_form.dart';

class PricingFormWidget extends StatelessWidget {
  final PricingForm form;

  const PricingFormWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: form.customerPriceInput.controller,
          validator: form.customerPriceInput.validate,
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: form.regularCustomerDiscountInput.controller,
          validator: form.regularCustomerDiscountInput.validate,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Скидка постоянного покупателя',
            hintText: 'Введите размер СПП',
            suffixIcon: const Icon(Icons.percent),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Observer(
            builder: (context) => Text(
              'Цена до СПП: ${form.priceBeforeRCDFormatted}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: form.sellerDiscountInput.controller,
          validator: form.sellerDiscountInput.validate,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: 'Скидка продавца',
            hintText: 'Введите размер скидки продавца',
            suffixIcon: const Icon(Icons.percent),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Observer(
            builder: (context) => Text(
              'Исходная цена (до скидок): ${form.priceFormatted}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
