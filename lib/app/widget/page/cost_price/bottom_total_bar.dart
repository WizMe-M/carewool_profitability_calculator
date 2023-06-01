import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

import '../../../../database/entity/commission.dart';
import '../../../../database/entity/storage.dart';
import '../../../../database/entity/cost_price.dart';
import '../../../../domain/cost_price/form/cost_price_form.dart';
import '../../../../domain/profitability/profitability_form.dart';
import '../../../../domain/util/strings.dart';
import '../../../navigation/app_router.dart';

class BottomTotalBar extends StatelessWidget {
  final Isar _isar = GetIt.I.get();
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
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Observer(
                        builder: (context) => Text(
                          '${form.formattedCostPrice}$rubleCurrency',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
    if (!form.isValid) {
      final String content =
          '${!form.isProductNameNotEmpty ? 'Название товара не заполнено.\n' : ''}'
          '${!form.isCostPricePositive ? 'Поля стоимости не заполнены.\n' : ''}'
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

    var messenger = ScaffoldMessenger.of(context);
    FocusManager.instance.primaryFocus?.unfocus();
    var costPrice = form.toEntity();
    _isar.writeTxn(() async {
      _isar.costPrices.put(costPrice);
    }).then((_) {
      _logger.i('Cost price was saved');
      messenger.showMaterialBanner(
        MaterialBanner(
          content: const Text('Расчёт себестоимости сохранён'),
          actions: [
            TextButton(
              onPressed: () => onProfitabilityTap(context, costPrice),
              child: const Text('Расчитать рентабельность'),
            ),
            TextButton(
              onPressed: () {
                messenger.hideCurrentMaterialBanner();
              },
              child: const Text('Скрыть'),
            ),
          ],
        ),
      );
    }).onError((e, s) {
      _logger.e('Caught an error while was saving cost calculation', e, s);
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Не удалось сохранить расчет'),
          duration: Duration(seconds: 1),
        ),
      );
    });
  }

  void onProfitabilityTap(
    BuildContext context,
    CostPrice costPrice,
  ) {
    var commissionUpload =
        _isar.commissionUploads.where().sortByUploadTimeDesc().findFirstSync();
    var storageUpload =
        _isar.storageUploads.where().sortByUploadTimeDesc().findFirstSync();

    if (commissionUpload == null || storageUpload == null) {
      context.router.push(ExcelUploadRoute());
    } else {
      context.router.push(
        ProfitabilityRoute(
          form: ProfitabilityForm(
            costPrice: costPrice,
            commissions: commissionUpload,
            storages: storageUpload,
          ),
        ),
      );
    }
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  }
}
