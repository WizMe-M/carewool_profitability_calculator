import 'package:isar/isar.dart';

part 'cost_price.g.dart';

@collection
class CostPrice {
  final Id id = Isar.autoIncrement;
  final String productName;
  final DateTime savedDate;
  final List<Block> blocks;
  final double total;

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
