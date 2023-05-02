import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../navigation/app_router.dart';
import '../../../../domain/cost_price/form/cost_price_form.dart';
import '../../../util/space.dart';
import '../../../../domain/entity/product/product.dart';
import '../../../../domain/database/repo/product_repository.dart';

class BottomTotalBar extends StatelessWidget {
  final Logger _logger = GetIt.I.get();

  final CostPriceForm form;

  BottomTotalBar({required this.form, super.key});

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
                        '${form.formattedCostPrice}₽',
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
                  child: const Text('Сохранить'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveProduct(BuildContext context) async {
    if (!form.canBeSaved) {
      final String content =
          '${!form.nameFilled ? 'Название товара не заполнено.\n' : ''}'
          '${!form.isCostPositive ? 'Поля стоимости не заполнены.\n' : ''}'
          '${!form.areInputsValid ? 'Некоторые поля формы заполнены некорректно.' : ''}';

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ошибка'),
          content: Text(content),
        ),
      );
      return;
    }

    var product = Product.fromForm(form: form);
    var repo = GetIt.I.get<ProductRepository>();

    repo.save(product).then((_) {
      _logger.i('Product was saved');
      FocusManager.instance.primaryFocus?.unfocus();
      var messenger = ScaffoldMessenger.of(context);
      messenger
        ..removeCurrentMaterialBanner()
        ..showMaterialBanner(
          MaterialBanner(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            content: const Text('Расчеты сохранены'),
            actions: [
              TextButton(
                onPressed: () {
                  messenger.hideCurrentMaterialBanner();
                  form.reset();
                },
                child: const Text('Очистить форму'),
              ),
              TextButton(
                onPressed: () {
                  messenger.hideCurrentMaterialBanner();
                  context.router.push(ProfitabilityRoute(product: product));
                },
                child: const Text('Расчитать рентабельность'),
              ),
            ],
          ),
        );
    }).onError((error, stackTrace) {
      _logger.e(
        'Caught an error while was saving cost calculation',
        error,
        stackTrace,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Не удалось сохранить расчет'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }
}
