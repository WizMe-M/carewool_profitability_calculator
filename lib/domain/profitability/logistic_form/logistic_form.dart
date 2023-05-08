import 'dart:math';

import 'package:mobx/mobx.dart';

import '../../../database/entity/storage.dart';
import 'storage_selector/storage_selector.dart';

import 'size_form/size_form.dart';

part 'logistic_form.g.dart';

class LogisticCalculator = LogisticCalculatorBase with _$LogisticCalculator;

abstract class LogisticCalculatorBase with Store {
  final StorageSelector storageSelector = StorageSelector.defaultTariffs();
  final SizeForm sizeForm = SizeForm();

  @computed
  Tariff? get logisticTariff => storageSelector.selected?.tariffs
      .firstWhere((tariff) => tariff.name == 'Логистика');

  @computed
  double get baseCost => logisticTariff?.baseCost ?? 0;

  @computed
  double get costPerLiter => logisticTariff?.costPerLiter ?? 0;

  @computed
  double get costForSize => baseCost + costPerLiter * sizeForm.overLiterCap;

  @computed
  double get costForExtraLarge {
    return sizeForm.isExtraLargeProduct
        ? max<double>(1000, costForSize)
        : costForSize;
  }

  /// Total logistics cost for inputted sizes of product
  @computed
  double get totalCost => logisticTariff != null ? costForExtraLarge : 0;
}
