import 'package:isar/isar.dart';

import '../simple_taxation_system_enum.dart';
import 'commission.dart';
import 'cost_price.dart';
import 'storage.dart';

part 'profitability.g.dart';

@collection
class ProfitabilityCalc {
  Id? id;

  late Size size;
  late Pricing pricing;

  @Enumerated(EnumType.name)
  late SimpleTaxationSystem tax;

  final IsarLink<CostPrice> costPrice = IsarLink();
  final IsarLink<Storage> storage = IsarLink();
  final IsarLink<Commission> commission = IsarLink();
}

@embedded
class Size {
  late double width;
  late double height;
  late double length;
}

@embedded
class Pricing {
  late double customerPrice;
  late int regularCustomerDiscount;
  late int sellerDiscount;
}