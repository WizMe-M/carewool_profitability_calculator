import 'package:isar/isar.dart';

part 'cost_price.g.dart';

@collection
class CostPrice {
  Id? id;
  late String productName;
  late DateTime savedDate;
  late List<Block> blocks;
  late double total;

  CostPrice(this.productName, this.savedDate, this.blocks, this.total);
}

@embedded
class Block {
  late String name;
  late List<Part> parts;

  Block();

  Block.withValues(this.name, this.parts);
}

@embedded
class Part {
  late String name;
  late double cost;

  Part();

  Part.withValues(this.name, this.cost);
}
