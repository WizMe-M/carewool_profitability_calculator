import 'dart:async';

import 'package:flutter/material.dart';

import '../../inputs/double_input.dart';

class CostPriceInput extends DoubleInput {
  /// Контроллер потока изменений текста в поле ввода
  StreamController? _streamController;

  /// Наименование (метка) поля ввода
  final String label;

  CostPriceInput({required this.label}) : super();

  CostPriceInput.withText({required this.label, required String text})
      : super.withText(text);

  /// Поток изменений текста в поле ввода
  Stream? get stream => _streamController?.stream;

  /// [Function] that should be executed when input was changed
  void onInputChanged() => _streamController!.add(null);

  /// Subscribes stream to [TextEditingController] listener
  void addControllerListeners() {
    _streamController = StreamController();
    controller.addListener(onInputChanged);
  }

  void removeControllerListeners() {
    controller.removeListener(onInputChanged);
    _streamController!.close();
    _streamController = null;
  }
}
