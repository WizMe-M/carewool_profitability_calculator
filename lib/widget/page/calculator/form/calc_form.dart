import 'package:carewool_profitability_calculator/viewmodel/form/product_calc_form.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/form_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CalcFormWidget extends StatelessWidget {
  final ProductFormStore _form = GetIt.I.get<ProductFormStore>();

  CalcFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form.key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Observer(
                builder: (context) => TextFormField(
                  onChanged: (value) => _form.productName = value,
                  readOnly: _form.isApplied,
                  decoration: const InputDecoration(
                    labelText: 'Товар',
                    hintText: 'Введите название',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
              ),
            ),
            ..._form.blocks.map(
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