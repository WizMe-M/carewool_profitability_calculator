import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/calculator/form/calculator_form.dart';
import '../side_bar.dart';
import '../calculator/bottom_total_bar.dart';
import '../calculator/calculator_form_widget.dart';
import '../calculator/calculator_app_bar.dart';

@RoutePage()
class CalculatorPage extends StatelessWidget {
  final CalculatorForm form;

  const CalculatorPage({required this.form, super.key});

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
