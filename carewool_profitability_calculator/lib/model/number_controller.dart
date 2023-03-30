import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';

class NumberController {
  final _controller = TextEditingController();

  TextEditingController get controller => _controller;

  Decimal get value => Decimal.tryParse(controller.text) ?? Decimal.zero;

  String? validate(String? s) {
    var shouldConvert = s != null && s.isNotEmpty;
    if (!shouldConvert) return null;

    var isValidNumber = Decimal.tryParse(s) != null;
    return isValidNumber ? null : 'Введите число';
  }
}
