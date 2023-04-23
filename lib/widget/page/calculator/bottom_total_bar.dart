import 'package:carewool_profitability_calculator/entity/parameter/parameter.dart';
import 'package:carewool_profitability_calculator/entity/product/product.dart';
import 'package:carewool_profitability_calculator/util/converter/converter_base.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/calculator_form.dart';
import 'package:carewool_profitability_calculator/viewmodel/repo/product_repository.dart';
import 'package:carewool_profitability_calculator/util/space.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class BottomTotalBar extends StatelessWidget {
  final CalculatorForm _form = GetIt.I.get<CalculatorForm>();
  final ProductRepository _repo = GetIt.I.get<ProductRepository>();

  BottomTotalBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3,
            blurRadius: 4,
          ),
        ],
      ),
      child: SizedBox(
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
                      builder: (context) => Text(
                        '${_form.costFormatted}₽',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 180,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ElevatedButton(
                  onPressed: () => saveProduct(context),
                  child: const Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveProduct(BuildContext context) async {
    if (!_form.canBeSaved) {
      final String content =
          '${!_form.nameFilled ? 'Название товара не заполнено.\n' : ''}'
          '${!_form.isCostPositive ? 'Поля стоимости не заполнены.\n' : ''}'
          '${!_form.areInputsValid ? 'Некоторые поля формы заполнены некорректно.' : ''}';

      var dialog = AlertDialog(
        title: const Text('Ошибка'),
        content: Text(content),
      );

      await showDialog(context: context, builder: (context) => dialog);
      return;
    }

    var converter = GetIt.I.get<ConverterBase<Product, CalculatorForm>>();
    var product = converter.toA(_form);

    FocusManager.instance.primaryFocus?.unfocus();
    _form.reset();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Расчеты сохранены'),
        duration: Duration(milliseconds: 1100),
      ),
    );
    await _repo.save(product);
  }
}
