import 'package:flutter/material.dart';

class SizeInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validate;
  final TextInputAction action;

  const SizeInputWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.validate,
    this.action = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      controller: controller,
      validator: validate,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: label,
        hintText: 'Введите размер (см)',
      ),
      textInputAction: action,
    );
  }
}
