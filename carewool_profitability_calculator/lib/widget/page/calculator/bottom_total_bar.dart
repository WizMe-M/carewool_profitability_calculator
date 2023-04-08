import 'package:carewool_profitability_calculator/viewmodel/form/product_calc_form.dart';
import 'package:carewool_profitability_calculator/widget/util/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BottomTotalBar extends StatelessWidget {
  final ProductCalcForm form;

  const BottomTotalBar({
    required this.form,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: SizedBox(
              width: 140,
              child: Row(
                children: [
                  const Text(
                    'Итого:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Space(4),
                  Observer(
                    builder: (context) {
                      return Text(
                        '${form.total}₽',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                onPressed: () => form.reset(),
                child: const Text('Reset'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
