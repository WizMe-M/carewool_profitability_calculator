import 'package:carewool_profitability_calculator/widget/page/calculator/bottom_totals_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/calc_form_widget.dart';
import 'package:decimal/decimal.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _formChangedEvent = Event<Value<Decimal>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Калькулятор себестоимости'),
      ),
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
                  child: CalcFormWidget(
                    formKey: _formKey,
                    formChangedEvent: _formChangedEvent,
                  ),
                ),
              ),
            ),
            BottomTotalBar(
              recountEvent: _formChangedEvent,
              formKey: _formKey,
            )
          ],
        ),
      ),
    );
  }
}
