import 'dart:math';

import 'simple_taxation_system.dart';
import 'logistic_form/size_form/size_form.dart';
import '../entity/category_item/category_item.dart';
import '../entity/storage_tariff/storage_tariff.dart';

class ProfitabilityCalculator {
  double calcLogistics(StorageTariff tariff, SizeForm size) {
    var logisticsForVolume = tariff.baseLogistic +
        max<double>(0, (size.volume - 5)) * tariff.additionalLogistic;

    var deliveryLogistics = size.isExtraLargeProduct
        ? max<double>(logisticsForVolume, 1000)
        : logisticsForVolume;

    var logistics = min<double>(deliveryLogistics, 10000);
    return logistics;
  }

  double calcSaleCommission(CategoryItem item) {
    var cost = 100;
    var commission = cost * item.fbo / 100;
    return commission;
  }

  double calcCostWithDiscount(double cost, double discount) =>
      cost * (100 - discount) / 100;

  double calcTotalPayment() {
    var tariff = StorageTariff(
      storageName: 'Базовые тарифы',
      baseLogistic: 50,
      additionalLogistic: 5,
      baseStoring: 0.1,
      additionalStoring: 0.01,
      baseAcceptance: 15,
      additionalAcceptance: 1.5,
    );
    var size = SizeForm();
    var paidAcceptance = 25;

    var cost = calcCostWithDiscount(100, 20);
    var commission = calcSaleCommission(
      CategoryItem(name: 'Косметические средства', fbo: 17, fbs: 17.9),
    );
    var logistics = calcLogistics(tariff, size);
    return cost - commission - logistics - paidAcceptance;
  }

  double calcTax(SimpleTaxationSystem tax) {
    var cost = calcCostWithDiscount(100, 20);
    switch (tax) {
      case SimpleTaxationSystem.perIncome:
        return cost * tax.taxSize;
      case SimpleTaxationSystem.perProfit:
        var payment = calcTotalPayment();
        return max<double>(0, payment - cost) * tax.taxSize;
    }
  }
}
