import 'package:carewool_profitability_calculator/viewmodel/form/form_block.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/ruble_input.dart';
import 'package:carewool_profitability_calculator/util/position.dart';
import 'package:flutter/material.dart';

class FormBlockWidget extends StatelessWidget {
  final FormBlock block;

  const FormBlockWidget({
    super.key,
    required this.block,
  });

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
            label: Text(block.title)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ...block.inputs.map(
                (input) {
                  final isFirst = block.inputs.first == input;
                  final isLast = block.inputs.last == input;
                  final isSingleItem = block.inputs.length == 1;
                  final Position inputPosition;

                  if (isSingleItem) {
                    inputPosition = Position.single;
                  } else if (isFirst) {
                    inputPosition = Position.first;
                  } else if (isLast) {
                    inputPosition = Position.last;
                  } else {
                    inputPosition = Position.middle;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: RubleInput(input: input, position: inputPosition),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
