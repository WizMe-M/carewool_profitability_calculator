import 'package:flutter/material.dart';

import '../../../../domain/profitability/logistic_form/logistic_form.dart';
import '../logistic/storage_selector_widget.dart';
import 'size_form_widget.dart';

class LogisticFormWidget extends StatelessWidget {
  final LogisticCalculator logisticCalculator;

  const LogisticFormWidget({required this.logisticCalculator, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StorageSelectorWidget(selector: logisticCalculator.storageSelector),
        SizeFormWidget(form: logisticCalculator.sizeForm),
        const SizedBox(height: 100),
      ],
    );
  }
}
