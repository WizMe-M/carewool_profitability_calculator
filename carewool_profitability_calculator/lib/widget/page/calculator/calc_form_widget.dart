import 'package:carewool_profitability_calculator/model/calc_form.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/form_block_widget.dart';
import 'package:decimal/decimal.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class CalcFormWidget extends StatelessWidget {
  CalcFormWidget({
    Key? key,
    required this.formKey,
    required this.formChangedEvent,
  }) : super(key: key);

  final CalcForm calcForm = CalcForm();
  final GlobalKey<FormState> formKey;
  final Event<Value<Decimal>> formChangedEvent;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: () {
        var total = calcForm.sumValues();
        formChangedEvent.broadcast(Value(total));
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                ...calcForm.blocks.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FormBlockWidget(formBlock: e),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
