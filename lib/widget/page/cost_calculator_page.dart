import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../side_bar.dart';
import '../cost_calculator/bottom_total_bar.dart';
import '../cost_calculator/calculator_form_widget.dart';
import '../cost_calculator/calculator_app_bar.dart';
import '../../viewmodel/cost_calculator/form/cost_calculator_form.dart';

@RoutePage()
class CostCalculatorPage extends StatelessWidget {
  final CostCalculatorForm form;

  const CostCalculatorPage({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalculatorAppBar(form: form),
      drawer: SideBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 28,
                  ),
                  child: CalculatorFormWidget(form: form),
                ),
              ),
            ),
            BottomTotalBar(form: form),
          ],
        ),
      ),
    );
  }
}
