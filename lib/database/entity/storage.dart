import 'package:isar/isar.dart';

part 'storage.g.dart';

@collection
class Storage {
  Id? id;
  String? name;
  List<Tariff>? tariffs;
}

@embedded
class Tariff {
  String? name;
  double? baseCost;
  double? costPerLiter;
}
