import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'size_input.g.dart';

class SizeInput = SizeInputBase with _$SizeInput;

abstract class SizeInputBase with Store {
  final Logger _logger = GetIt.I.get();
  final NumberFormat _formatter = NumberFormat()
    ..minimumFractionDigits = 0
    ..maximumFractionDigits = 2;

  /// [TextEditingController] of this input
  final controller = TextEditingController();

  @observable
  double _value = 0;

  SizeInputBase() {
    controller.addListener(() => _onInputChanges(controller.text));
  }

  /// Value (double) that is inputted
  @computed
  double get value => _value;

  /// Formatted value for string output
  /// - 4 -> 4
  /// - 13.0 -> 13
  /// - 42.5901 -> 42.59
  @computed
  String get formatted => _formatter.format(value);

  /// Listener of controller's input changes
  ///
  /// Parses nums as double and empty/null string as 0
  @action
  void _onInputChanges(String? s) {
    if (s == null) _value = 0;

    if (validate(s) == null) {
      _value = double.tryParse(s!) ?? 0;
    }
  }

  /// Clear controller text and input value
  void clear() => controller.clear();

  /// Проверяет строку на корректность
  ///
  /// Валидными строками являются целые и дробные числа больше нуля
  /// ('2', '9.', '3.14')
  ///
  /// TODO: separate in validation class
  String? validate(String? s) {
    if (s == null || s.isEmpty) {
      _logger.w('Input was null');
      return null;
    }

    var num = double.tryParse(s);
    if (num == null) {
      _logger.w('Input is not a number: "$s"');
      return 'Введите число';
    }

    if (num <= 0) {
      _logger.w('Input is less or equal zero: "$num"');
      return 'Число должно быть больше нуля';
    }

    return null;
  }
}
