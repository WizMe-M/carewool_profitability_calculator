import 'package:carewool_profitability_calculator/widget/nav/calculation_history_side_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/bottom_total_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/calculator_form_widget.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/calculator_app_bar.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

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
                  child: CalculatorFormWidget(),
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
