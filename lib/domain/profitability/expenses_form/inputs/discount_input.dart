import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class DiscountInput {
  final Logger _logger = GetIt.I.get();
  final TextEditingController controller = TextEditingController();

  String get text => controller.text;

  /// Gets [double] value of inputted text
  int get value => isValid ? int.tryParse(text) ?? 0 : 0;

  /// Checks is input's [text] valid
  bool get isValid => validate(text) == null;

  /// Checks do the string [s] is valid and returns [Null] or error text.
  ///
  /// Valid strings are [Null], empty and positive [int] numbers.
  String? validate(String? s) {
    if (s == null || s.isEmpty) return null;

    var num = int.tryParse(s);
    if (num == null) {
      _logger.w('Input is not a number: "$s"');
      return 'Введите целое число';
    }

    if (num < 0 || num > 100) {
      _logger.w('Input is less or equal zero: "$num"');
      return 'Процентное значение должно быть в диапазоне от 0 до 100';
    }

    return null;
  }
}