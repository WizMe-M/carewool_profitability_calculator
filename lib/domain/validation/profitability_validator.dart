import '../profitability/profitability_form.dart';
import 'validator.dart';

class ProfitabilityValidator extends Validator<ProfitabilityForm> {
  @override
  Set<String> validate(ProfitabilityForm object) {
    var errors = <String>{};
    if (object.logistics.size.volume <= 0) {
      errors.add('Все размеры должны быть больше 0');
    }
    if (object.logistics.storageSelector.selected == null) {
      errors.add('Склад должен быть выбран');
    }
    if (object.pricing.commissionSelector.selected == null) {
      errors.add('Категория товара должна быть выбрана');
    }
    if (!object.pricing.form.customerPriceInput.isValid) {
      errors.add('Цена продажи содержит некорректное значение');
    }
    if (object.pricing.form.customerPrice <= 0) {
      errors.add('Цена продажи должна быть больше нуля');
    }
    if (!object.pricing.form.regularCustomerDiscountInput.isValid) {
      errors.add(
        'Скидка постоянного покупателя содержит некорректное значение',
      );
    }
    if (!object.pricing.form.sellerDiscountInput.isValid) {
      errors.add('Скидка продавца содержит некорректное значение');
    }

    return errors;
  }
}
