import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../database/entity/commission.dart';
import '../../database/entity/profitability.dart';
import '../../database/entity/storage.dart';
import '../../database/entity/cost_price.dart';
import 'commission_selector/commission_selector.dart';
import 'pricing/pricing_form.dart';
import '../../database/simple_taxation_system_enum.dart';
import 'size_form/size_form.dart';
import 'storage_selector/storage_selector.dart';

part 'profitability_form.g.dart';

class ProfitabilityForm = ProfitabilityFormBase with _$ProfitabilityForm;

abstract class ProfitabilityFormBase with Store {
  final CostPrice costPrice;
  final StorageSelector storageSelector;
  final CommissionSelector categorySelector;

  final sizeForm = SizeForm();
  final pricingForm = PricingForm();

  @observable
  SimpleTaxationSystem selectedTax = SimpleTaxationSystem.perIncome;

  ProfitabilityFormBase({
    required this.costPrice,
    required CommissionUpload commissions,
    required StorageUpload storages,
  })  : storageSelector = StorageSelector(upload: storages),
        categorySelector = CommissionSelector(upload: commissions);

  @computed
  Tariff? get logisticTariff => storageSelector.selected?.tariffs
      .firstWhere((tariff) => tariff.name == 'Логистика');

  @computed
  double get logisticBaseCost => logisticTariff?.baseCost ?? 0;

  @computed
  double get logisticCostPerLiter => logisticTariff?.costPerLiter ?? 0;

  @computed
  double get logisticCostForSize =>
      logisticBaseCost + logisticCostPerLiter * sizeForm.overLiterCap;

  @computed
  double get logisticCostForExtraLarge {
    return sizeForm.isExtraLargeProduct
        ? max<double>(1000, logisticCostForSize)
        : logisticCostForSize;
  }

  /// Total logistics cost for inputted sizes of product
  @computed
  double get logisticTotalCost =>
      logisticTariff != null ? logisticCostForExtraLarge : 0;

  /// Cost of paid acceptance, if it's included in storage tariffs
  @computed
  double get paidAcceptanceCost {
    var acceptanceTariff = storageSelector.selected?.tariffs
        .firstWhere((tariff) => tariff.name == 'Приёмка');
    return acceptanceTariff?.baseCost ?? 0;
  }

  // Income for one saled production
  @computed
  double get price => pricingForm.priceBeforeRCD;

  /// Commission on sale for set [price]
  @computed
  double get commissionForCost => price * categorySelector.fbsCommission / 100;

  /// Expenses on sale
  @computed
  double get expenses =>
      costPrice.total! +
      commissionForCost +
      logisticTotalCost +
      paidAcceptanceCost;

  /// Amount of tax to pay
  @computed
  double get taxSize {
    var tax = selectedTax.taxSize / 100;
    switch (selectedTax) {
      case SimpleTaxationSystem.perIncome:
        return price * tax;
      case SimpleTaxationSystem.perProfit:
        return max<double>(0, price - expenses) * tax;
    }
  }

  /// Total expenses after tax payment
  @computed
  double get expensesWithTax => expenses + taxSize;

  /// Profit from production sale
  @computed
  double get profit => price - expensesWithTax;

  /// Profitability of sale (from 0 to 1)
  @computed
  double get profitability => profit / price;

  ProfitabilityCalc toEntity() {
    var size = Size()
      ..width = sizeForm.width.value
      ..length = sizeForm.length.value
      ..height = sizeForm.height.value;
    var pricing = Pricing()
      ..customerPrice = pricingForm.customerPrice
      ..regularCustomerDiscount = pricingForm.regularCustomerDiscount
      ..sellerDiscount = pricingForm.sellerDiscount;
    var entity = ProfitabilityCalc()
      ..savedDate = DateTime.now()
      ..profitability = profitability
      ..pricing = pricing
      ..size = size
      ..tax = selectedTax
      ..commission.value = categorySelector.selected
      ..storage.value = storageSelector.selected
      ..costPrice.value = costPrice;
    return entity;
  }
}
