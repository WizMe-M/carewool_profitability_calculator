import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../app/navigation/app_router.dart';
import '../cost_price/form/cost_price_form.dart';

enum LoadError {
  missingUploads(
    'Не были импортированы необходимые для расчётов данные',
    'Перейти на страницу загрузки',
  ),
  noSavedCostPrices(
    'Нет сохраненных\nрасчётов себестоимости',
    'Добавить новый расчёт',
  );

  final String errorMessage;
  final String errorButtonText;

  const LoadError(this.errorMessage, this.errorButtonText);

  void Function(BuildContext ctx) get onTap {
    switch (this) {
      case LoadError.noSavedCostPrices:
        return (BuildContext ctx) {
          var form = CostPriceForm.defaultTemplate();
          ctx.router.push(CostCalculatorRoute(form: form));
        };
      case LoadError.missingUploads:
        return (BuildContext ctx) => ctx.router.push(ExcelUploadRoute());
    }
  }
}
