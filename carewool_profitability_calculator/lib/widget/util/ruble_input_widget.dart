import 'package:flutter/material.dart';

class RubleInput extends StatelessWidget {
  const RubleInput(
      {required this.controller,
      required this.labelText,
      required this.validator,
      this.textInputAction = TextInputAction.next,
      this.focusNode,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputAction textInputAction;
  final String? Function(String?) validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          label: Text(labelText),
          suffixIcon: const Icon(Icons.currency_ruble)),
      focusNode: focusNode,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}
