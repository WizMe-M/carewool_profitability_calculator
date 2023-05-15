import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dfunc/dfunc.dart';

import '../../../database/entity/cost_price.dart';
import 'template/form_template.dart';
import 'form_block.dart';
import 'input.dart';

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
  List<CostPriceInput> allInputs = [];

  /// [TextEditingController] of product name
  final TextEditingController productNameController = TextEditingController();

  CostPriceFormBase.fromTemplate({required FormTemplate template}) {
    blocks = template.structure.entries.map((entry) {
      return FormBlock(
        title: entry.key,
        inputs: entry.value.map((inputLabel) {
          return CostPriceInput(label: inputLabel);
        }).toList(),
      );
    }).toList();

    initForm();
  }

  CostPriceFormBase.defaultTemplate()
      : this.fromTemplate(template: FormTemplate.standard());

  CostPriceFormBase.fromEntity({required CostPrice costPrice}) {
    productNameController.text = costPrice.productName!;
    var formatter = NumberFormat()
      ..minimumFractionDigits = 0
      ..maximumFractionDigits = 2;

    for (var block in costPrice.blocks!) {
      blocks.add(
        FormBlock(
          title: block.name!,
          inputs: block.parts!
              .map((part) => CostPriceInput.withText(
                    label: part.name!,
                    text: part.cost! > 0 ? formatter.format(part.cost) : '',
                  ))
              .toList(),
        ),
      );
    }

    initForm();
  }

  CostPrice toEntity() {
    var entity = CostPrice(
      productName,
      DateTime.now(),
      blocks.map((formBlock) {
        var block = Block()
          ..name = formBlock.title
          ..parts = formBlock.inputs.map((input) {
            return Part()
              ..name = input.label
              ..cost = input.value;
          }).toList();
        return block;
      }).toList(),
      _costPrice,
    );

    return entity;
  }

  /// Total cost formatted to output
  ///
  /// ```
  /// 1 -> 1.00
  /// 2.4 -> 2.40
  /// 42.001 -> 42.001
  /// 213.200 -> 213.20
  /// 110.9999 -> 110.9999
  /// ```
  @computed
  String get formattedCostPrice => _costFormatter.format(_costPrice);

  /// Trimmed product name
  String get productName => productNameController.text.trim();

  /// Does form inputs contain valid value
  bool get areInputsValid => allInputs.every((input) => input.isValid);

  /// Is product name not empty or spaces
  bool get isProductNameNotEmpty => productName.isNotEmpty;

  /// Is cost price more than zero
  bool get isCostPricePositive => _costPrice > 0;

  /// Is form valid (product name is not empty to save, cost price is positive,
  /// all form's inputs contain valid values) to be saved
  bool get isValid =>
      isProductNameNotEmpty && isCostPricePositive && areInputsValid;

  /// Recalculates product's cost from all inputs' values
  @action
  void _calculateCostPrice() {
    _costPrice = sum(allInputs.map<double>((e) => e.value));
    _logger.i('Cost price was recalculated: $_costPrice');
  }

  /// Clears all of form inputs' values
  @action
  void reset() {
    unsubscribeFromInputStreams();

    productNameController.clear();
    for (var element in allInputs) {
      element.clear();
    }

    subscribeToInputStreams();
    _logger.i('Form was resetted');

    _calculateCostPrice();
  }

  /// Initializes form
  void initForm() {
    setAllInputs();
    subscribeToInputStreams();
    _calculateCostPrice();
  }

  void setAllInputs() {
    allInputs = blocks.fold(
      allInputs,
      (inputList, block) => inputList..addAll(block.inputs),
    );
    _logger.i('Folded blocks inputs');
  }

  /// Subscribes on changes from inputs' streams to recalculate cost price.
  ///
  /// Add to [allInputs] controller listener.
  ///
  /// Sets [_changesStreamSub] as subscription of [_calculateCostPrice] on
  /// merged [allInputs]' streams.
  void subscribeToInputStreams() {
    for (var input in allInputs) {
      input.addControllerListeners();
    }

    _changesStreamSub = Rx.merge(allInputs.map((input) => input.stream!))
        .listen((_) => _calculateCostPrice());
    _logger.i('Subscription created and input listeners are subscribed');
  }

  /// Unsubscribes of changes from inputs' stremas.
  ///
  /// Removes controller listeners from [allInputs].
  ///
  /// Cancels [_changesStreamSub] subscription and sets it to null.
  void unsubscribeFromInputStreams() {
    _changesStreamSub!.cancel();
    for (var input in allInputs) {
      input.removeControllerListeners();
    }
    _changesStreamSub = null;
    _logger.i('Subscription cancelled and input listeners are unsubscribed');
  }
}
