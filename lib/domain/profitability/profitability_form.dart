import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../database/entity/commission.dart';
import '../../database/entity/storage.dart';
import '../../database/entity/cost_price.dart';
import 'commission_selector/commission_selector.dart';
import 'inputs/cost_input.dart';
import 'inputs/discount_input.dart';
import 'simple_taxation_system_enum.dart';
import 'size_form/size_form.dart';
import 'storage_selector/storage_selector.dart';

part 'profitability_form.g.dart';

class ProfitabilityForm = ProfitabilityFormBase with _$ProfitabilityForm;

abstract class ProfitabilityFormBase with Store {
  final CostPrice costPrice;
  final StorageSelector storageSelector;
  final CommissionSelector categorySelector;

  final sizeForm = SizeForm();
  final desiredCost = CostInput();
  final discount = DiscountInput();

  @observable
  double desiredCostValue = 0;

  @observable
  int discountValue = 0;

  @observable
  SimpleTaxationSystem selectedTax = SimpleTaxationSystem.perIncome;

  ProfitabilityFormBase({
    required this.costPrice,
    required CommissionUpload commissions,
    required StorageUpload storages,
  })  : storageSelector = StorageSelector(upload: storages),
        categorySelector = CommissionSelector(upload: commissions) {
    addListeners();
  }

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
  double get discountedCost => desiredCostValue * (100 - discountValue) / 100;

  /// Commission on sale for set [discountedCost]
  @computed
  double get commissionForCost =>
      discountedCost * categorySelector.fbsCommission;

  @computed
  double get expenses =>
      costPrice.total! +
      categorySelector.fbsCommission +
      logisticTotalCost +
      paidAcceptanceCost;

  @computed
  double get taxSize {
    var tax = selectedTax.taxSize / 100;
    switch (selectedTax) {
      case SimpleTaxationSystem.perIncome:
        return discountedCost * tax;
      case SimpleTaxationSystem.perProfit:
        return max<double>(0, discountedCost - expenses) * tax;
    }
  }

  @computed
  double get expensesWithTax => expenses + taxSize;

  @computed
  double get profit => discountedCost - expensesWithTax;

  @computed
  double get profitability => profit / discountedCost;

  void addListeners() {
    desiredCost.controller.addListener(() {
      desiredCostValue = desiredCost.value;
    });
    discount.controller.addListener(() {
      discountValue = discount.value;
    });
  }
}
