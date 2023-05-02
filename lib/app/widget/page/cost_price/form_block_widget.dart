import 'package:flutter/material.dart';

import 'input_widget.dart';
import '../../../../domain/cost_price/form_block.dart';
import '../../../util/position.dart';

class FormBlockWidget extends StatelessWidget {
  final FormBlock block;

  const FormBlockWidget({required this.block, super.key});

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
                  final Position inputPosition;
                  final isFirst = block.inputs.first == input;
                  final isLast = block.inputs.last == input;
                  final isSingleItem = block.inputs.length == 1;

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
                    child: InputWidget(input: input, position: inputPosition),
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
