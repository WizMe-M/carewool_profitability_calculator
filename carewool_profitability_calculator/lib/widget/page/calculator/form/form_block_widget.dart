import 'package:carewool_profitability_calculator/model/form_block.dart';
import 'package:carewool_profitability_calculator/widget/util/ruble_input_widget.dart';
import 'package:flutter/material.dart';

class FormBlockWidget extends StatelessWidget {
  const FormBlockWidget({Key? key, required this.formBlock}) : super(key: key);

  final FormBlock formBlock;

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
            label: Text(formBlock.title)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ...formBlock.inputs.map(
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
