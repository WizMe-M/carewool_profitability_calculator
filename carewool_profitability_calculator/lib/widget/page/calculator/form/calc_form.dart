import 'package:carewool_profitability_calculator/viewmodel/form/product_calc_form.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/form_block.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CalcFormWidget extends StatelessWidget {
  final ProductCalcForm form = GetIt.I.get<ProductCalcForm>();

  CalcFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form.key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            ...form.blocks.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FormBlockWidget(viewmodel: e),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
