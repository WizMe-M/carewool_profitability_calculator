import 'package:mobx/mobx.dart';

import '../../../database/entity/profitability.dart';
import '../../model/commission.dart';
import '../../util/formatting.dart';
import 'commission_selector.dart';
import 'pricing_form.dart';

part 'pricing_calculator.g.dart';

class PricingCalculator = PricingCalculatorBase with _$PricingCalculator;

abstract class PricingCalculatorBase with Store {
  final CommissionSelector commissionSelector;
  final PricingForm form;

  PricingCalculatorBase(this.commissionSelector) : form = PricingForm();

  PricingCalculatorBase.withPrices(this.commissionSelector, Pricing pricing)
      : form = PricingForm.withData(
          pricing.customerPrice,
          pricing.regularCustomerDiscount,
          pricing.sellerDiscount,
        );

  @computed
  Commission get selected {
    if (commissionSelector.selected != null) {
      var entity = commissionSelector.selected;
      return Commission(entity!);
    }
    return Commission.defaultValue();
  }

  @computed
  double get commission => selected.fbo;

  /// Commission on sale for income
  @computed
  double get commissionSize => form.priceBeforeRCD * commission / 100;

  @computed
  String get commissionFormatted => Formatting.formatPercentage(commission);

  @computed
  String get commissionSizeFormatted {
    return Formatting.formatCostRu(commissionSize);
  }
}
