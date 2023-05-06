import 'package:isar/isar.dart';

part 'cost_price.g.dart';

@collection
class CostPrice {
  Id? id;
  String? productName;
  DateTime? savedDate;
  List<Block>? blocks;
  double? total;

  CostPrice(this.productName, this.savedDate, this.blocks, this.total);
}

@embedded
class Block {
  String? name;
  List<Part>? parts;
}

@embedded
class Part {
  String? name;
  double? cost;
}
