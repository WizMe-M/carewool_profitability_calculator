import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../database/entity/commission.dart';
import '../../database/entity/profitability.dart';
import '../../database/entity/storage.dart';
import '../../database/entity/cost_price.dart';
import '../../database/simple_taxation_system_enum.dart';
import '../util/formatting.dart';
import 'pricing/commission_selector.dart';
import 'logistics/logistics_calculator.dart';
import 'pricing/pricing_calculator.dart';
import 'logistics/storage_selector.dart';

part 'profitability_form.g.dart';

class ProfitabilityForm = ProfitabilityFormBase with _$ProfitabilityForm;

abstract class ProfitabilityFormBase with Store {
  final CostPrice costPrice;
  final LogisticsCalculator logistics;
  final PricingCalculator pricing;

  @observable
  SimpleTaxationSystem selectedTax = SimpleTaxationSystem.perIncome;

  ProfitabilityFormBase({
    required this.costPrice,
    required CommissionUpload commissions,
    required StorageUpload storages,
  })  : pricing = PricingCalculator(CommissionSelector(upload: commissions)),
        logistics = LogisticsCalculator(StorageSelector(upload: storages));

  // Income for one saled production
  @computed
  double get income => pricing.form.priceBeforeRCD;

  /// Expenses on sale
  @computed
  double get expenses {
    return costPrice.total + pricing.commissionSize + logistics.totalCost;
  }

  /// Amount of tax to pay
  @computed
  double get taxSize {
    var tax = selectedTax.taxSize / 100;
    switch (selectedTax) {
      case SimpleTaxationSystem.perIncome:
        return income * tax;
      case SimpleTaxationSystem.perProfit:
        return max<double>(0, income - expenses) * tax;
    }
  }

  /// Total expenses after tax payment
  @computed
  double get expensesWithTax => expenses + taxSize;

  /// Profit from production sale
  @computed
  double get profit => income - expensesWithTax;

  /// Profitability of sale (from 0 to 1)
  @computed
  double get profitability => profit / income;

  // -----------------------------------------------------------------------

  @computed
  String get taxFormatted => Formatting.formatPercentage(selectedTax.taxSize);

  @computed
  String get taxSizeFormatted => Formatting.formatCostRu(taxSize);

  /// Formatted expenses on logistics
  @computed
  String get incomeFormatted => Formatting.formatCostRu(income);

  /// Formatted expenses on logistics
  @computed
  String get expenseProductionFormatted {
    return Formatting.formatCostRu(costPrice.total);
  }

  /// Formatted expenses on logistics
  @computed
  String get expensesCommissionFormatted => pricing.commissionSizeFormatted;

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
  String get expensesFormatted => Formatting.formatCostRu(expenses);

  /// Formatted total expenses
  @computed
  String get expensesWithTaxFormatted {
    return Formatting.formatCostRu(expensesWithTax);
  }

  /// Formatted profit
  @computed
  String get profitFormatted => Formatting.formatCostRu(profit);

  /// Formatted profitability (from 0 to 100%)
  @computed
  String get profitabilityFormatted {
    return Formatting.formatPercentage(profitability * 100);
  }

  // -----------------------------------------------------------------------

  ProfitabilityCalc toEntity() {
    var size = Size.withValues(
      logistics.size.width,
      logistics.size.height,
      logistics.size.length,
    );
    var pricingEntity = Pricing.withValues(
      pricing.form.customerPrice,
      pricing.form.regularCustomerDiscount,
      pricing.form.sellerDiscount,
    );
    var entity = ProfitabilityCalc.withValues(
      DateTime.now(),
      costPrice.productName,
      costPrice.total,
      profitability,
      size,
      pricingEntity,
      selectedTax,
    )
      ..commission.value = pricing.commissionSelector.selected
      ..storage.value = logistics.storageSelector.selected;
    return entity;
  }
}
