import 'package:carewool_profitability_calculator/widget/nav/side_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/bottom_total_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/calc_form.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/top_title_bar.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalcAppBar(),
      drawer: const SideBar(),
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
                  child: CalcFormWidget(),
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
