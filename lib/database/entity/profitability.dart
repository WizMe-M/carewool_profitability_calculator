import 'package:isar/isar.dart';

import '../simple_taxation_system_enum.dart';
import 'commission.dart';
import 'storage.dart';

part 'profitability.g.dart';

@collection
class ProfitabilityCalc {
  Id? id;

  late DateTime savedDate;
  late String productName;
  late double costPrice;
  late double profitability;
  late Size size;
  late Pricing pricing;

  @Enumerated(EnumType.name)
  late SimpleTaxationSystem tax;

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
