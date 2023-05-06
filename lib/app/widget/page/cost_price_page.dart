import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/cost_price/form/cost_price_form.dart';
import '../side_bar.dart';
import 'cost_price/bottom_total_bar.dart';
import 'cost_price/cost_price_form_widget.dart';

@RoutePage()
class CostCalculatorPage extends StatelessWidget {
  final CostPriceForm form;

  const CostCalculatorPage({required this.form, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Калькулятор себестоимости',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: form.reset,
            icon: const Icon(Icons.delete),
            tooltip: 'Очистить форму',
          ),
        ],
      ),
      drawer: GetIt.I.get<SideBar>(),
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
                  child: CostPriceFormWidget(form: form),
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
