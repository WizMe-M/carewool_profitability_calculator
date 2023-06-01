import 'package:isar/isar.dart';

import '../simple_taxation_system_enum.dart';
import 'commission.dart';
import 'cost_price.dart';
import 'storage.dart';

part 'profitability.g.dart';

@collection
class ProfitabilityCalc {
  Id? id;

  late DateTime savedDate;

  late double profitability;
  late Size size;
  late Pricing pricing;

  @Enumerated(EnumType.name)
  late SimpleTaxationSystem tax;

  final IsarLink<Storage> storage = IsarLink();
  final IsarLink<Commission> commission = IsarLink();
  final IsarLink<CostPrice> costPrice = IsarLink();

  ProfitabilityCalc();

  ProfitabilityCalc.withValues(
    this.savedDate,
    this.profitability,
    this.size,
    this.pricing,
    this.tax,
  );
}

@embedded
class Size {
  late double width;
  late double height;
  late double length;

  Size();

  Size.withValues(this.width, this.height, this.length);
}

@embedded
class Pricing {
  late double customerPrice;
  late int regularCustomerDiscount;
  late int sellerDiscount;

  Pricing();

  Pricing.withValues(
    this.customerPrice,
    this.regularCustomerDiscount,
    this.sellerDiscount,
  );
}
