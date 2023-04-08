import 'package:carewool_profitability_calculator/viewmodel/form/form_block.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/ruble_input.dart';
import 'package:flutter/material.dart';

class FormBlockWidget extends StatelessWidget {
  const FormBlockWidget({super.key, required this.viewmodel});

  final FormBlock viewmodel;

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
                  child: RubleInput(input: e),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
