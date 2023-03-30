import 'package:carewool_profitability_calculator/viewmodel/form_block_vm.dart';
import 'package:carewool_profitability_calculator/widget/util/ruble_input_widget.dart';
import 'package:flutter/material.dart';

class FormBlock extends StatelessWidget {
  const FormBlock({super.key, required this.viewmodel});

  final FormBlockViewModel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InputDecorator(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            label: Text(viewmodel.title)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ...viewmodel.inputs.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: RubleInput(
                    controller: e.controller,
                    labelText: e.label,
                    validator: e.validate,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
