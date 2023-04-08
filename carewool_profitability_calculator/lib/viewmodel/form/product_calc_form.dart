import 'package:carewool_profitability_calculator/viewmodel/form/form_block.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dfunc/dfunc.dart';

part 'product_calc_form.g.dart';

class ProductCalcForm = ProductCalcFormBase with _$ProductCalcForm;

abstract class ProductCalcFormBase with Store {
  final GlobalKey<FormState> key = GlobalKey();
  final List<FormBlock> blocks;

  late List<Input> _allInputs;

  @observable
  double _totalSum = 0;

  ProductCalcFormBase({required this.blocks});

  @computed
  String get total => _totalSum.toStringAsFixed(2);

  @action
  void calculateTotal() {
    _totalSum = sum(blocks.map<double>((e) => e.calculateSum()));
  }

  void init() {
    _allInputs = blocks.fold(
      [],
      (inputList, block) => inputList..addAll(block.inputs),
    );

    for (var input in _allInputs) {
      input.setupReaction();
    }

    Rx.merge(_allInputs.map((input) => input.stream))
        .listen((_) => calculateTotal());
  }

  void reset() {
    key.currentState!.reset();
    for (var input in _allInputs) {
      input.clear();
    }
  }
}
