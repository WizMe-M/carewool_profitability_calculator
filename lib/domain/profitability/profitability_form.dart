import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../database/entity/commission.dart';
import '../../database/entity/profitability.dart';
import '../../database/entity/storage.dart';
import '../../database/entity/cost_price.dart';
import '../../database/simple_taxation_system_enum.dart';
import '../util/formatting.dart';
import 'commission_selector/commission_selector.dart';
import 'logistics/logistics_calculator.dart';
import 'pricing/pricing_form.dart';
import 'storage_selector/storage_selector.dart';

part 'profitability_form.g.dart';

class ProfitabilityForm = ProfitabilityFormBase with _$ProfitabilityForm;

abstract class ProfitabilityFormBase with Store {
  final CostPrice costPrice;
  final CommissionSelector categorySelector;
  final LogisticsCalculator logistics;
  final pricingForm = PricingForm();

  @observable
  SimpleTaxationSystem selectedTax = SimpleTaxationSystem.perIncome;

  ProfitabilityFormBase({
    required this.costPrice,
    required CommissionUpload commissions,
    required StorageUpload storages,
  })  : categorySelector = CommissionSelector(upload: commissions),
        logistics = LogisticsCalculator(StorageSelector(upload: storages));

  // Income for one saled production
  @computed
  double get price => pricingForm.priceBeforeRCD;

  /// Commission on sale for set [price]
  @computed
  double get commissionForCost => price * categorySelector.fbsCommission / 100;

  /// Expenses on sale
  @computed
  double get expenses =>
      costPrice.total + commissionForCost + logistics.totalCost;

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

  /// Formatted expenses on logistics
  @computed
  String get incomeFormatted {
    return Formatting.formatCostRu(price);
  }

  /// Formatted expenses on logistics
  @computed
  String get expenseProductionFormatted {
    return Formatting.formatCostRu(costPrice.total);
  }
  /// Formatted expenses on logistics
  @computed
  String get expensesCommissionFormatted {
    return Formatting.formatCostRu(commissionForCost);
  }

  /// Formatted expenses on logistics
  @computed
  String get expensesLogisticsFormatted {
    return Formatting.formatCostRu(logistics.totalCost);
  }

  /// Formatted expenses on tax
  @computed
  String get expensesTaxFormatted => Formatting.formatCostRu(taxSize);

  /// Formatted total expenses
  @computed
  String get expensesFormatted => Formatting.formatCostRu(expensesWithTax);

  /// Formatted profit
  @computed
  String get profitFormatted => Formatting.formatCostRu(profit);

  /// Formatted profitability (from 0 to 100%)
  @computed
  String get profitabilityFormatted {
    return Formatting.formatPercentage(profitability * 100);
  }

  ProfitabilityCalc toEntity() {
    var size = Size.withValues(
      logistics.size.width,
      logistics.size.height,
      logistics.size.length,
    );
    var pricing = Pricing.withValues(
      pricingForm.customerPrice,
      pricingForm.regularCustomerDiscount,
      pricingForm.sellerDiscount,
    );
    var entity = ProfitabilityCalc.withValues(
      DateTime.now(),
      costPrice.productName,
      costPrice.total,
      profitability,
      size,
      pricing,
      selectedTax,
    )
      ..commission.value = categorySelector.selected
      ..storage.value = logistics.storageSelector.selected;
    return entity;
  }
}
