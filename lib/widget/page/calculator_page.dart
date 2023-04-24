import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../viewmodel/form/calculator_form.dart';
import '../nav/calculation_history_side_bar.dart';
import 'calculator/bottom_total_bar.dart';
import 'calculator/calculator_form_widget.dart';
import 'calculator/calculator_app_bar.dart';

class CalculatorPage extends StatelessWidget {
  final CalculatorForm _form = GetIt.I.get<CalculatorForm>();

  CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalculatorAppBar(),
      drawer: CalculationHistorySideBar(),
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
                  child: CalculatorFormWidget(form: _form),
                ),
              ),
            ),
            BottomTotalBar(),
          ],
        ),
      ),
    );
  }
}