import 'package:mobx/mobx.dart';

import '../../inputs/double_input.dart';
import '../../inputs/discount_input.dart';
import '../../util/formatting.dart';

part 'pricing_form.g.dart';

class PricingForm = PricingFormBase with _$PricingForm;

abstract class PricingFormBase with Store {
  final customerPriceInput = DoubleInput();
  final regularCustomerDiscountInput = DiscountInput();
  final sellerDiscountInput = DiscountInput();

  PricingFormBase() {
    initListeners();
  }

  @observable
  double customerPrice = 0;

  @observable
  int regularCustomerDiscount = 0;

  @observable
  int sellerDiscount = 0;

  @computed
  double get priceBeforeRCD {
    var coefficient = 1 - regularCustomerDiscount / 100;
    return customerPrice / coefficient;
  }

  @computed
  double get price {
    var coefficient = 1 - sellerDiscount / 100;
    return priceBeforeRCD / coefficient;
  }

  @computed
  String get priceBeforeRCDFormatted => Formatting.formatCostRu(priceBeforeRCD);

  @computed
  String get priceFormatted => Formatting.formatCostRu(price);

  void initListeners() {
    customerPriceInput.controller.addListener(() {
      customerPrice = customerPriceInput.value;
    });
    regularCustomerDiscountInput.controller.addListener(() {
      regularCustomerDiscount = regularCustomerDiscountInput.value;
    });
    sellerDiscountInput.controller.addListener(() {
      sellerDiscount = sellerDiscountInput.value;
    });
  }
}
