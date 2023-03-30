import 'package:flutter/material.dart';

class RubleInput extends StatelessWidget {
  const RubleInput(
      {required this.controller,
      required this.labelText,
      required this.validator,
      this.textInputAction,
      this.focusNode,
      this.autofocus = false,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputAction? textInputAction;
  final String? Function(String?) validator;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        label: Text(labelText),
        suffixIcon: const Icon(Icons.currency_ruble),
      ),
      focusNode: focusNode,
      textInputAction: textInputAction,
      validator: validator,
      autofocus: autofocus,
    );
  }
}
