import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../viewmodel/calculator/input/input.dart';
import '../../util/position.dart';

class InputWidget extends StatelessWidget {
  final Position position;
  final Input input;

  const InputWidget({
    required this.position,
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
          hintText: 'Введите стоимость',
          suffixIcon: const Icon(Icons.currency_ruble),
          errorText: input.error,
        ),
        autofocus: position == Position.first || position == Position.single,
        textInputAction: position == Position.last
            ? TextInputAction.done
            : TextInputAction.next,
      ),
    );
  }
}
