import 'package:flutter/material.dart';

import '../validation/validator.dart';

/// [Input] wrap for text field
abstract class Input<T extends num> {
  /// Validator for text input
  abstract final Validator<String?> validator;

  /// Controller for text field's input
  final TextEditingController controller;

  Input() : controller = TextEditingController();

  Input.withText(String text) : controller = TextEditingController(text: text);

  /// Inputted text
  String get text => controller.text;

  /// Is inputted text valid
  bool get isValid => validate(text) == null;

  T get defaultValue;

  /// [T] representation of input's text
  T get value {
    if (!isValid) {
      return defaultValue;
    }
    return parseInput() ?? defaultValue;
  }

  /// Validates text with validator's method
  String? validate(String? s) => validator.validateOnce(text);

  /// Returns parsed input's text
  T? parseInput();

  /// Clear inputted text
  void clear() => controller.clear();

  void dispose() => controller.dispose();
}
