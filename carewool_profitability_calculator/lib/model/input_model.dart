import 'package:carewool_profitability_calculator/model/number_controller.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class InputModel {
  InputModel({required this.label});

  final String label;
  final _numberController = NumberController();

  TextEditingController get controller => _numberController.controller;

  Decimal get value => _numberController.value;

  String? validate(String? input) => _numberController.validate(input);
}
