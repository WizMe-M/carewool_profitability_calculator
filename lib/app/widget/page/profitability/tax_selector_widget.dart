import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/profitability/profitability_form.dart';
import '../../../../domain/profitability/simple_taxation_system.dart';

class TaxSelectorWidget extends StatelessWidget {
  final ProfitabilityForm form;

  const TaxSelectorWidget({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Observer(
        builder: (context) => SegmentedButton<SimpleTaxationSystem>(
          segments: const [
            ButtonSegment(
              value: SimpleTaxationSystem.perIncome,
              label: Text('УСН 6% (доходы)'),
            ),
            ButtonSegment(
              value: SimpleTaxationSystem.perProfit,
              label: Text('УСН 15% (доходы-расходы)'),
            ),
          ],
          selected: {form.selectedTax},
          onSelectionChanged: (set) => form.selectedTax = set.single,
        ),
      ),
    );
  }
}
