import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../inputs/double_input.dart';
import '../../inputs/discount_input.dart';

part 'pricing_form.g.dart';

class PricingForm = PricingFormBase with _$PricingForm;

abstract class PricingFormBase with Store {
  final _formatter = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;
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
  String get priceBeforeRCDFormatted => _formatter.format(priceBeforeRCD);

  @computed
  double get price {
    var coefficient = 1 - sellerDiscount / 100;
    return priceBeforeRCD / coefficient;
  }

  @computed
  String get priceFormatted => _formatter.format(price);

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
