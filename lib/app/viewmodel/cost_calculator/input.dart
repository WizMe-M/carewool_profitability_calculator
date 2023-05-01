import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

/// Числовое поле ввода
class Input {
  final Logger logger = GetIt.I.get<Logger>();

  /// Контроллер потока изменений текста в поле ввода
  final StreamController _streamController = StreamController();

  /// Наименование (метка) поля ввода
  final String label;

  /// Текущий введенный текст
  final TextEditingController controller;

  Input({required this.label}) : controller = TextEditingController();

  Input.withText({required this.label, required String text})
      : controller = TextEditingController(text: text);

  /// Поток изменений текста в поле ввода
  Stream get stream => _streamController.stream;

  String get text => controller.text;

  /// Числовое представление текста
  double get value => isValid ? double.tryParse(text) ?? 0 : 0;

  /// Проверяет, корректно ли значение в поле
  bool get isValid => validate(text) == null;

  /// Subscribes stream to [TextEditingController] listener
  void init() {
    controller.addListener(() => _streamController.add(null));
  }

  /// Проверяет строку на корректность
  ///
  /// Валидными строками являются пустые строки ('' или ' '),
  /// целые и дробные числа больше нуля ('2', '9.', '3.14')
  String? validate(String? s) {
    if (s == null || s.isEmpty) return null;

    var num = double.tryParse(s);
    if (num == null) {
      logger.w('Input is not a number: "$s"');
      return 'Введите число';
    }

    if (num <= 0) {
      logger.w('Input is less or equal zero: "$num"');
      return 'Число должно быть больше нуля';
    }

    return null;
  }

  /// Clear inputted text
  void clear() => controller.clear();

  void dispose() => controller.dispose();
}
