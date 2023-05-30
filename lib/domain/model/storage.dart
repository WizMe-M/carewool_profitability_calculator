import '../../database/entity/storage.dart' as db;
import '../util/formatting.dart';

const double baseLogisticsCost = 50;
const double additionalLogisticsCost = baseLogisticsCost / 10;
const double baseStoringCost = 0.1;
const double additionalStoringCost = baseStoringCost / 10;

/// Wrap-model for the db entity
class Storage {
  final db.Storage entity;

  Storage(this.entity);

  String get name => entity.name;

  double get coefficient => entity.costCoefficient;

  double get baseLogistics => coefficient / 100 * baseLogisticsCost;

  double get additionalLogistics => coefficient / 100 * additionalLogisticsCost;

  String get coefficientFormatted {
    return Formatting.formatPercentage(coefficient);
  }

  String get baseLogisticsFormatted {
    return Formatting.formatCostRu(baseLogistics);
  }

  String get additionalLogisticsFormatted {
    return Formatting.formatCostRu(additionalLogistics);
  }
}

/// Default storage tariffs
final class DefaultStorage extends Storage {
  DefaultStorage() : super(db.Storage.withValues('Тарифы по умолчанию', 100));
}
