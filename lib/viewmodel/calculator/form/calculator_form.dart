import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dfunc/dfunc.dart';

import '../form_block.dart';
import '../input.dart';
import '../../../entity/product/product.dart';

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

  /// [TextEditingController] of product name
  final TextEditingController nameController;

  CalculatorFormBase._({required this.blocks, String productName = ''})
      : nameController = TextEditingController(text: productName);

  CalculatorFormBase.defaultTemplate()
      : this._(blocks: [
    FormBlock(
      title: 'Тара',
      inputs: [
        Input(label: 'Крышка'),
        Input(label: 'Дозатор'),
        Input(label: 'Флакон'),
      ],
    ),
    FormBlock(
      title: 'Упаковка',
      inputs: [
        Input(label: 'Этикетка'),
        Input(label: 'Коробка'),
      ],
    ),
    FormBlock(
      title: 'Производство',
      inputs: [
        Input(label: 'Розлив'),
        Input(label: 'Обклейка'),
      ],
    ),
    FormBlock(
      title: 'Логистика',
      inputs: [
        Input(label: 'Логистика от пр-ва'),
        Input(label: 'Логистика до пр-ва'),
      ],
    ),
  ]);

  CalculatorFormBase.fromProduct({required Product product})
      : this._(
    productName: product.name,
    blocks: product.blocks.map(
          (block) {
        return FormBlock(
          title: block.name,
          inputs: block.parameters.map(
                (parameter) {
              if (parameter.cost != 0) {
                var formatter = NumberFormat()
                  ..minimumFractionDigits = 0;
                var formatted = formatter.format(parameter.cost);

                return Input.withText(
                  label: parameter.name,
                  text: formatted,
                );
              }
              return Input(label: parameter.name);
            },
          ).toList(),
        );
      },
    ).toList(),
  );

  String get name => nameController.text.trim();

  /// Проверяет, валидны ли значения во всех полях
  bool get areInputsValid => allInputs.every((input) => input.isValid);

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
      input.init();
    }
    debugPrint('INFO | all inputs initialized');

    _calculationFormStreamSub = Rx.merge(allInputs.map((input) => input.stream))
        .listen((_) => _calculateTotalCost());
    debugPrint('INFO | stream initialized');

    _calculateTotalCost();
  }

  /// Пересчитать итоговую себестоимость продукции
  @action
  void _calculateTotalCost() {
    _totalCost = sum(allInputs.map<double>((e) => e.value));
    debugPrint('INFO | sum recalculate: $_totalCost');
  }

  /// Очистить форму (все поля и значения)
  @action
  void reset() {
    debugPrint('INFO | form reset called');
    _calculationFormStreamSub!.pause();
    // key.currentState!.reset();
    nameController.clear();
    for (var element in allInputs) {
      element.clear();
    }
    _calculationFormStreamSub!.resume();
  }
}
