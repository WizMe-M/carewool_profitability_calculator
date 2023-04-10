import 'package:carewool_profitability_calculator/viewmodel/form/form_block.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dfunc/dfunc.dart';

part 'product_calc_form.g.dart';

class ProductFormStore = ProductFormStoreBase with _$ProductFormStore;

abstract class ProductFormStoreBase with Store {
  final GlobalKey<FormState> key = GlobalKey();
  final List<FormBlock> blocks;

  late List<Input> allInputs;

  @observable
  bool isApplied = false;

  @observable
  String productName = '';

  @observable
  double _totalSum = 0;

  ProductFormStoreBase({required this.blocks});

  bool get formStateIsValid => allInputs.every((input) => input.error == null);

  @computed
  String get name => productName.trim();

  @computed
  String get total => _totalSum.toStringAsFixed(2);

  @computed
  bool get nameFilled => name.isNotEmpty;

  @computed
  bool get costFilled => _totalSum > 0;

  @computed
  bool get canBeSaved => nameFilled && costFilled && formStateIsValid;

  @computed
  String get buttonText => isApplied ? 'Изменить' : 'Сохранить';

  @action
  void calculateTotal() {
    _totalSum = sum(allInputs.map<double>((e) => e.value));
  }

  @action
  void reset() {
    key.currentState!.reset();
    productName = '';
    for (var input in allInputs) {
      input.clear();
    }
  }

  @action
  void toggleButton() {
    if (name.isEmpty) {
      return;
    }

    isApplied = !isApplied;
  }

  void init() {
    allInputs = blocks.fold(
      [],
      (inputList, block) => inputList..addAll(block.inputs),
    );

    for (var input in allInputs) {
      input.setupReaction();
    }

    Rx.merge(allInputs.map((input) => input.stream))
        .listen((_) => calculateTotal());
  }
}
