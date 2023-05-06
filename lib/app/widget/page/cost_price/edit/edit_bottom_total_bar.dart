import 'package:auto_route/auto_route.dart';
import 'package:carewool_profitability_calculator/database/entity/cost_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import '../../../../../domain/cost_price/form/edit/edit_wrap.dart';
import '../../../../navigation/app_router.dart';
import '../../../../util/space.dart';

class EditBottomTotalBar extends StatelessWidget {
  final Isar _isar = GetIt.I.get();
  final Logger _logger = GetIt.I.get();

  final EditWrap editWrap;

  EditBottomTotalBar({required this.editWrap, super.key});

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
                        '${editWrap.form.formattedCostPrice}₽',
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
                  onPressed: () => saveChanges(context),
                  child: const Text('Сохранить изменения'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveChanges(BuildContext context) async {
    if (!editWrap.form.isValid) {
      final String content =
          '${!editWrap.form.isProductNameNotEmpty ? 'Название товара не заполнено.\n' : ''}'
          '${!editWrap.form.isCostPricePositive ? 'Поля стоимости не заполнены.\n' : ''}'
          '${!editWrap.form.areInputsValid ? 'Некоторые поля формы заполнены некорректно.' : ''}';

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Ошибка'),
          content: Text(content),
        ),
      );
      return;
    }

    var messenger = ScaffoldMessenger.of(context);
    var updatedCostPrice = editWrap.toEntity();

    _isar.writeTxn(() async {
      await _isar.costPrices.put(updatedCostPrice);
    }).then((updated) {
      _logger.i('Product was saved');

      var newEditWrap = EditWrap(costPrice: updatedCostPrice);
      context.router.replace(EditCostPriceRoute(editWrap: newEditWrap));

      messenger.showSnackBar(
        const SnackBar(
          content: Text('Изменения сохранены'),
          duration: Duration(seconds: 1),
        ),
      );
    }).onError((e, s) {
      _logger.e('Caught an error while was saving changes', e, s);

      messenger.showSnackBar(
        const SnackBar(
          content: Text('Не удалось сохранить изменения'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }
}
