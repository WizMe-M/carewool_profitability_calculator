import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class CalcForm {
  final capController = TextEditingController();
  final dispenserController = TextEditingController();
  final bottleController = TextEditingController();
  final stickerController = TextEditingController();
  final boxController = TextEditingController();
  final fillingController = TextEditingController();
  final pastingController = TextEditingController();

  Decimal sumValues() {
    var sum = Decimal.zero;
    sum += _decimalFromString(capController.text);
    sum += _decimalFromString(dispenserController.text);
    sum += _decimalFromString(bottleController.text);
    sum += _decimalFromString(stickerController.text);
    sum += _decimalFromString(boxController.text);
    sum += _decimalFromString(fillingController.text);
    sum += _decimalFromString(pastingController.text);
    return sum;
  }

  static Decimal _decimalFromString(String s) =>
      Decimal.tryParse(s) ?? Decimal.zero;
}
