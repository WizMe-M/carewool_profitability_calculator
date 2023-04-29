import 'dart:math';

class ProfitabilityCalculator {
  double calcLogistics() {
    // TODO: parse excel "Коэффициент" sheet
    var storageTariffs = [
      {'min_tariff': 50, 'tariff_per_liter': 5},
    ];

    // TODO: pick selected storage from dropdowns
    var storage = storageTariffs.first;
    var tariff = storage['min_tariff'] as double;
    var tariffPerLiter = storage['tariff_per_liter'] as double;

    var size = ProductSize(2.5, 12, 2.5); // TODO: set sizes from inputs

    var logisticsForVolume =
        tariff + max<double>(0, (size.volume - 5)) * tariffPerLiter;

    var deliveryLogistics = size.isExtraLargeProduct
        ? max<double>(logisticsForVolume, 1000)
        : logisticsForVolume;

    var logistics = min<double>(deliveryLogistics, 10000);
    return logistics;
  }

  double calcSaleCommission() {
    // TODO: parse excel "Логистика, комиссия" sheet
    var categories = [
      {'name': 'Косметическое средство', 'fbo': 17},
    ];

    // TODO: pick selected item from category and subcategory dropdowns
    var category = categories.first;
    var fboCommissionSize = category['fbo'] as double;

    var cost = 100; // TODO: set cost from product total 'cost price'
    var commission = cost * fboCommissionSize / 100;
    return commission;
  }

  double calcCostWithDiscount(double cost, double discount) =>
      cost * (100 - discount) / 100;

  double calcTotalPayment() {
    var cost = calcCostWithDiscount(100, 20);
    var paidAcceptance = 25;
    var commission = calcSaleCommission();
    var logistics = calcLogistics();
    return cost - commission - logistics - paidAcceptance;
  }

  // TODO: pick selected tax from STS taxes dropdown
  double calcTax(SimpleTaxSystem tax) {
    var cost = calcCostWithDiscount(100, 20);
    switch (tax) {
      case SimpleTaxSystem.perIncome:
        return cost * tax.taxSize;
      case SimpleTaxSystem.perProfit:
        var payment = calcTotalPayment();
        return max<double>(0, payment - cost);
    }
  }
}

enum SimpleTaxSystem {
  perIncome(6),
  perProfit(15);

  final double taxSize;

  const SimpleTaxSystem(this.taxSize);
}

class ProductSize {
  final double width;
  final double height;
  final double length;

  ProductSize(this.width, this.height, this.length);

  double get volume => (width * height * length) / 1000;

  bool get isExtraLargeProduct {
    var maxMoreThan120 = length > 120 || height > 120 || width > 120;
    var sumSizeMoreThan200 = length + height + width > 200;
    return maxMoreThan120 || sumSizeMoreThan200;
  }
}
