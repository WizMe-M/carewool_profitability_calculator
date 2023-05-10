import 'package:flutter/material.dart';

import '../../../../domain/cost_price/form/input.dart';
import 'position_enum.dart';

class InputWidget extends StatelessWidget {
  final Position position;
  final Input input;

  const InputWidget({required this.position, required this.input, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: input.controller,
      validator: input.validate,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: input.label,
        hintText: 'Введите стоимость',
        suffixIcon: const Icon(Icons.currency_ruble),
      ),
      textInputAction: position.action,
    );
  }
}
