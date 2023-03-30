import 'package:carewool_profitability_calculator/viewmodel/calc_form_vm.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/form_block.dart';
import 'package:decimal/decimal.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class CalcForm extends StatelessWidget {
  CalcForm({
    super.key,
    required this.formKey,
    required this.formChangedEvent,
  });

  final CalcFormViewModel viewmodel = CalcFormViewModel();
  final GlobalKey<FormState> formKey;
  final Event<Value<Decimal>> formChangedEvent;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: () {
        var total = viewmodel.sumValues();
        formChangedEvent.broadcast(Value(total));
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            ...viewmodel.blocks.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: FormBlock(viewmodel: e),
            )),
          ],
        ),
      ),
    );
  }
}
