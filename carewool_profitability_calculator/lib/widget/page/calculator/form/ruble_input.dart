import 'package:carewool_profitability_calculator/viewmodel/form/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RubleInput extends StatelessWidget {
  final Input input;

  const RubleInput({
    required this.input,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TextFormField(
        onChanged: (value) => input.text = value,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: input.label,
          hintText: 'Введите число',
          suffixIcon: const Icon(Icons.currency_ruble),
          errorText: input.error,
        ),
      ),
    );
  }
}
