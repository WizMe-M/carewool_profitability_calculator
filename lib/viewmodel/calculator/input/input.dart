import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'input.g.dart';

/// Числовое поле ввода
class Input = InputBase with _$Input;

abstract class InputBase with Store {
  /// Контроллер потока изменений текста в поле ввода
  final StreamController _streamController = StreamController();

  /// Наименование (метка) поля ввода
  final String label;

  /// Список реакций
  late List<ReactionDisposer> _disposers;

  /// Текущий введенный текст
  @observable
  String text = '';

  /// Сообщение об ошибке валидации
  @observable
  String? error;

  InputBase({required this.label});

  InputBase.filled({required this.label, required this.text});

  /// Поток изменений текста в поле ввода
  Stream get stream => _streamController.stream;

  /// Числовое представление текста
  @computed
  double get value => isValid ? double.tryParse(text) ?? 0 : 0;

  /// Проверяет, корректно ли значение в поле
  @computed
  bool get isValid => error == null;

  /// Инициализировать реакции
  void setupReaction() {
    _disposers = [
      reaction((_) => text, validate),
      reaction((_) => text, _streamController.add),
    ];
  }

  void dispose() {
    for (var d in _disposers) {
      d();
    }
  }

  /// Очистить поле от текста
  @action
  void clear() => text = '';

  /// Проверяет строку на корректность
  ///
  /// Валидными строками являются пустые строки ('' или ' '),
  /// целые и дробные числа больше нуля ('2', '9.', '3.14')
  @action
  void validate(String s) {
    if (s.isEmpty) {
      error = null;
      return;
    }

    var num = double.tryParse(s);
    if (num == null) {
      debugPrint('WARN | input is not a number: "$s"');
      error = 'Введите число';
      return;
    }

    if (num <= 0) {
      debugPrint('WARN | input is less or equal zero: "$num"');
      error = 'Число должно быть больше нуля';
      return;
    }

    error = null;
  }
}
