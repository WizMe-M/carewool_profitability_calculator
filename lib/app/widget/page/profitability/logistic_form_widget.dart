import 'package:carewool_profitability_calculator/app/viewmodel/profitability/logistic_form/logistic_form.dart';
import 'package:carewool_profitability_calculator/app/widget/page/profitability/size_form_widget.dart';
import 'package:flutter/material.dart';

class LogisticFormWidget extends StatelessWidget {
  LogisticFormWidget({super.key});

  final form = LogisticForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizeFormWidget(form: form.sizeForm),
      ],
    );
  }
}
