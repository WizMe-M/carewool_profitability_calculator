import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dfunc/dfunc.dart';

import '../form_block.dart';
import '../input.dart';
import '../../../entity/product/product.dart';

part 'cost_calculator_form.g.dart';

/// Form of calculating product's cost
class CostCalculatorForm = CostCalculatorFormBase with _$CostCalculatorForm;

abstract class CostCalculatorFormBase with Store {
  final Logger logger = GetIt.I.get<Logger>();

  /// Product cost format
  ///
  /// Lets to format product cost value in next ways:
  /// ```dart
  /// _costFormatter.format(2); // 2.00
  /// _costFormatter.format(4.12); // 4.12
  /// _costFormatter.format(9.9090); // 9.909
  /// _costFormatter.format(0.100001); // 0.10
  /// ```
  final NumberFormat _costFormatter = NumberFormat()
    ..minimumFractionDigits = 2
    ..maximumFractionDigits = 4;

  /// Subscription of all inputs' changes stream
  StreamSubscription? _changesStreamSub;

  /// Logical blocks of form
  final List<FormBlock> blocks;

  /// All form's inputs
  late List<Input> allInputs;

  /// Total product's cost
  @observable
  double _totalCost = 0;

  /// [TextEditingController] of product name
  final TextEditingController nameController;

  CostCalculatorFormBase._({required this.blocks, String productName = ''})
      : nameController = TextEditingController(text: productName);

  CostCalculatorFormBase.defaultTemplate()
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

  CostCalculatorFormBase.fromProduct({required Product product})
      : this._(
          productName: product.name,
          blocks: product.blocks.map(
            (block) {
              return FormBlock(
                title: block.name,
                inputs: block.parameters.map(
                  (parameter) {
                    if (parameter.cost != 0) {
                      var formatter = NumberFormat()..minimumFractionDigits = 0;
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

  /// Total cost formatted to output
  ///
  /// Uses [_costFormatter]
  @computed
  String get costFormatted => _costFormatter.format(_totalCost);

  /// Trimmed product name
  String get name => nameController.text.trim();

  /// Whether all form inputs contains valid value
  bool get areInputsValid => allInputs.every((input) => input.isValid);

  /// Whether product name is inputted and is not spaces
  bool get nameFilled => name.isNotEmpty;

  /// Whether total product cost is more than zero
  bool get isCostPositive => _totalCost > 0;

  /// Whether form calculation is valid to save
  bool get canBeSaved => nameFilled && isCostPositive && areInputsValid;

  /// Folds all form inputs, initializes them, subscribes to their streams
  /// and calculates initial product's cost
  void init() {
    logger.i('Form initalize started');
    allInputs = blocks.fold([], (inputList, block) {
      return inputList..addAll(block.inputs);
    });

    for (var input in allInputs) {
      input.init();
    }
    logger.i('Form inputs were initialized');

    _changesStreamSub = Rx.merge(allInputs.map((input) => input.stream))
        .listen((_) => _calculateTotalCost());
    logger.i('Stream of changes were initialized');

    _calculateTotalCost();
  }

  /// Recalculates product's cost from all inputs' values
  @action
  void _calculateTotalCost() {
    _totalCost = sum(allInputs.map<double>((e) => e.value));
    logger.i('Sum was recalculated: $_totalCost');  }

  /// Clears all of form inputs' values
  @action
  void reset() {
    _changesStreamSub!.pause();
    nameController.clear();
    for (var element in allInputs) {
      element.clear();
    }
    _changesStreamSub!.resume();
    logger.i('Form was resetted');
  }
}
