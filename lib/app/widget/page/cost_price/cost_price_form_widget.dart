import 'package:flutter/material.dart';

import 'form_block_widget.dart';
import '../../../../domain/cost_price/form/cost_price_form.dart';

class CostPriceFormWidget extends StatelessWidget {
  final CostPriceForm form;

  const CostPriceFormWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                controller: form.productNameController,
                decoration: const InputDecoration(
                  labelText: 'Товар',
                  hintText: 'Введите название',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
            ...form.blocks.map(
              (block) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FormBlockWidget(block: block),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
