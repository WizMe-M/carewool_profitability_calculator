import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../../../../domain/cost_price/form/edit/edit_cost_price_form.dart';
import '../../../../../domain/database/repo/product_repository.dart';
import '../../../../../domain/entity/product/product.dart';
import '../../../../navigation/app_router.dart';
import '../../../../util/space.dart';

class EditBottomTotalBar extends StatelessWidget {
  final Logger _logger = GetIt.I.get();

  final EditWrapCostPriceForm editWrap;

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

    var repo = GetIt.I.get<ProductRepository>();
    var id = editWrap.productId;
    var updatedProduct = Product.fromForm(form: editWrap.form);
    var messenger = ScaffoldMessenger.of(context);

    repo.update(id, updatedProduct).then((_) {
      _logger.i('Product was saved');
      var newEditWrap = EditWrapCostPriceForm(
        savedProduct: updatedProduct,
        productId: id,
      );
      context.router.replace(EditCostPriceRoute(editWrap: newEditWrap));
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Изменения сохранены'),
          duration: Duration(seconds: 1),
        ),
      );
    }).onError((error, stackTrace) {
      _logger.e(
        'Caught an error while was saving changes',
        error,
        stackTrace,
      );
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Не удалось сохранить изменения'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }
}
