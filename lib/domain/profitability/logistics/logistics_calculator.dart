import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../model/storage.dart';
import '../../util/formatting.dart';
import 'size_form.dart';
import 'storage_selector.dart';

part 'logistics_calculator.g.dart';

class LogisticsCalculator = LogisticsCalculatorBase with _$LogisticsCalculator;

abstract class LogisticsCalculatorBase with Store {
  static const double minExtraLargeCost = 1000;

  final StorageSelector storageSelector;
  final SizeForm size;

  LogisticsCalculatorBase(this.storageSelector) : size = SizeForm();

  LogisticsCalculatorBase.withSizes(this.storageSelector, this.size);

  String get minExtraLargeCostFormatted {
    return Formatting.formatCostRu(minExtraLargeCost);
  }

  @computed
  Storage get selected {
    if (storageSelector.selected != null) {
      var entity = storageSelector.selected;
      return Storage(entity!);
    }
    return Storage.defaultValue();
  }

  @computed
  double get costForSize {
    var additionalCost = size.overLiterCap * selected.additionalLogistics;
    return selected.baseLogistics + additionalCost;
  }

  @computed
  double get costForExtraLarge {
    return max<double>(minExtraLargeCost, costForSize);
  }

  @computed
  double get totalCost {
    return size.isExtraLargeProduct ? costForExtraLarge : costForSize;
  }

  @computed
  String get totalCostFormatted => Formatting.formatCostRu(totalCost);
}
