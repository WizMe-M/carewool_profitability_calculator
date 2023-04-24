import 'dart:async';

import 'package:carewool_profitability_calculator/viewmodel/form/form_block.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dfunc/dfunc.dart';

part 'calculator_form.g.dart';

/// Состояние формы расчета себестоимости продукции
class CalculatorForm = CalculatorFormBase with _$CalculatorForm;

abstract class CalculatorFormBase with Store {
  /// Подписка на поток данных об изменениях в полях формы
  StreamSubscription? _calculationFormStreamSub;

  /// Ключ от формы
  ///
  /// Применяется для очистки полей формы
  final GlobalKey<FormState> key = GlobalKey();

  /// Список логических блоков формы
  final List<FormBlock> blocks;

  /// Список всех состояний всех полей ввода (независимо от блока)
  late List<Input> allInputs;

  /// Итоговая себестоимость продукции
  @observable
  double _totalCost = 0;

  /// Название продукции
  @observable
  String productName = '';

  CalculatorFormBase({required this.blocks});

  /// Проверяет, валидны ли значения во всех полях
  bool get areInputsValid => allInputs.every((input) => input.error == null);

  @computed
  String get name => productName.trim();

  /// Итоговая себестоимость в строковом представлении (0.00)
  @computed
  String get costFormatted => _totalCost.toStringAsFixed(2);

  /// Проверяет, заполнено ли название продукции
  @computed
  bool get nameFilled => name.isNotEmpty;

  /// Проверяет, больше ли итоговая себестоимость больше нуля
  @computed
  bool get isCostPositive => _totalCost > 0;

  /// Проверяет, возможно ли сохранить расчет
  @computed
  bool get canBeSaved => nameFilled && isCostPositive && areInputsValid;

  /// Инициализировать форму.
  ///
  /// Инициализирует все дочерние поля, подписывается на их изменения
  void init() {
    debugPrint('INFO | form initialize');
    allInputs = blocks.fold([], (inputList, block) {
      return inputList..addAll(block.inputs);
    });

    for (var input in allInputs) {
      input.setupReaction();
    }
    debugPrint('INFO | all inputs initialized');

    _calculationFormStreamSub = Rx.merge(allInputs.map((input) => input.stream))
        .listen((_) => calculateTotalCost());
    debugPrint('INFO | stream initialized');
  }

  /// Пересчитать итоговую себестоимость продукции
  @action
  void calculateTotalCost() {
    _totalCost = sum(allInputs.map<double>((e) => e.value));
    debugPrint('INFO | sum recalculate: $_totalCost');
  }

  /// Очистить форму (все поля и значения)
  @action
  void reset() {
    debugPrint('INFO | form reset called');
    _calculationFormStreamSub!.pause();
    key.currentState!.reset();
    productName = '';
    for (var input in allInputs) {
      input.clear();
    }
    _calculationFormStreamSub!.resume();
  }
}
