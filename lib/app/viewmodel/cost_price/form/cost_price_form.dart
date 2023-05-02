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
import '../../../../domain/entity/product/product.dart';

part 'cost_price_form.g.dart';

/// Form of calculating product's cost
class CostPriceForm = CostPriceFormBase with _$CostPriceForm;

abstract class CostPriceFormBase with Store {
  final Logger _logger = GetIt.I.get();

  final NumberFormat _costFormatter = NumberFormat()
    ..minimumFractionDigits = 2
    ..maximumFractionDigits = 4;

  /// Subscription of all inputs' changes stream
  StreamSubscription? _changesStreamSub;

  /// Total product's cost
  @observable
  double _costPrice = 0;

  /// Logical blocks of form
  List<FormBlock> blocks = [];

  /// All form's inputs
  List<Input> allInputs = [];

  /// [TextEditingController] of product name
  final TextEditingController productNameController = TextEditingController();

  CostPriceFormBase._({required this.blocks, String productName = ''}) {
    productNameController.text = productName;
    subscribeToInputStreams();
  }

  CostPriceFormBase();

  CostPriceFormBase.defaultTemplate()
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

  CostPriceFormBase.fromProduct({required Product product})
      : this._(
          productName: product.name,
          blocks: [
            for (var block in product.blocks)
              FormBlock(
                title: block.name,
                inputs: block.parameters.map((parameter) {
                  if (parameter.cost != 0) {
                    var formatter = NumberFormat()..minimumFractionDigits = 0;
                    var formatted = formatter.format(parameter.cost);

                    return Input.withText(
                      label: parameter.name,
                      text: formatted,
                    );
                  }

                  return Input(label: parameter.name);
                }).toList(),
              ),
          ],
        );

  /// Total cost formatted to output
  ///
  @computed
  String get formattedCostPrice => _costFormatter.format(_costPrice);

  /// Trimmed product name
  String get productName => productNameController.text.trim();

  /// Whether all form inputs contains valid value
  bool get areInputsValid => allInputs.every((input) => input.isValid);

  /// Whether product name is inputted and is not spaces
  bool get nameFilled => productName.isNotEmpty;

  /// Whether total product cost is more than zero
  bool get isCostPositive => _costPrice > 0;

  /// Whether form calculation is valid to save
  bool get canBeSaved => nameFilled && isCostPositive && areInputsValid;

  /// Recalculates product's cost from all inputs' values
  @action
  void _calculateTotalCost() {
    _costPrice = sum(allInputs.map<double>((e) => e.value));
    _logger.i('Sum was recalculated: $_costPrice');
  }

  /// Clears all of form inputs' values
  @action
  void reset() {
    _changesStreamSub!.pause();
    productNameController.clear();
    for (var element in allInputs) {
      element.clear();
    }
    _changesStreamSub!.resume();
    _logger.i('Form was resetted');
  }

  void fillWithProduct(Product product) {
    productNameController.text = product.name;

    var formatter = NumberFormat()
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = 4;

    for (var block in product.blocks) {
      blocks.add(
        FormBlock(
          title: block.name,
          inputs: [
            for (var param in block.parameters)
              Input.withText(
                label: param.name,
                text: param.cost > 0 ? formatter.format(param.cost) : '',
              ),
          ],
        ),
      );
    }

    subscribeToInputStreams();
  }

  void subscribeToInputStreams() {
    allInputs = blocks.fold(
      allInputs,
      (inputList, block) => inputList..addAll(block.inputs),
    );

    for (var input in allInputs) {
      input.addControllerListeners();
    }

    _changesStreamSub = Rx.merge(allInputs.map((input) => input.stream))
        .listen((_) => _calculateTotalCost());

    _logger.i('Stream of changes were initialized');
  }

  Future<void> unsubscribeFromInputStreamsAsync() async {
    await _changesStreamSub!.cancel();

    for (var input in allInputs) {
      input.removeControllerListeners();
    }

    allInputs.clear();
    _changesStreamSub = null;

    _logger.i('Subscription cancelled and input listeners are unsubscribed');
  }
}
