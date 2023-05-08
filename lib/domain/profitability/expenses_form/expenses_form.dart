import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../../database/entity/upload.dart';
import '../simple_taxation_system.dart';
import 'category_selector/category_selector.dart';
import 'inputs/cost_input.dart';
import 'inputs/discount_input.dart';

part 'expenses_form.g.dart';

class ExpensesForm = ExpensesFormBase with _$ExpensesForm;

abstract class ExpensesFormBase with Store {
  final Upload upload;
  final CategorySelector categorySelector;

  final cost = CostInput();
  final discount = DiscountInput();

  @observable
  double costValue = 0;

  @observable
  int discountValue = 0;

  @observable
  SimpleTaxationSystem selectedTax = SimpleTaxationSystem.perIncome;

  ExpensesFormBase({required this.upload})
      : categorySelector =
            CategorySelector(categoryList: upload.categories.value!);

  @computed
  double get discountedCost => costValue * (100 - discountValue) / 100;

  @computed
  double get commissionForCost =>
      discountedCost * categorySelector.fboCommission;

  @computed
  double get taxSize {
    switch (selectedTax) {
      case SimpleTaxationSystem.perIncome:
        return discountedCost * selectedTax.taxSize;
      case SimpleTaxationSystem.perProfit:
        var payment = 0; // TODO: total payment
        return max<double>(0, payment - discountedCost) * selectedTax.taxSize;
    }
  }

  void addListeners() {
    cost.controller.addListener(() => costValue = cost.value);
    discount.controller.addListener(() => discountValue = discount.value);
  }
}
