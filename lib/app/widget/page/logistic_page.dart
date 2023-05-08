import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../database/entity/cost_price.dart';
import '../../../domain/profitability/logistic_form/logistic_form.dart';
import '../../../domain/util/symbols.dart';
import '../side_bar.dart';
import 'logistic/logistic_form_widget.dart';
import 'logistic/logistic_result_widget.dart';

@RoutePage()
class LogisticPage extends StatelessWidget {
  final LogisticCalculator _logisticCalculator = LogisticCalculator();
  final CostPrice costPrice;

  LogisticPage({required this.costPrice, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор рентабельности')),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Себестоимость: ${costPrice.total}$rubleCurrency'),
                LogisticFormWidget(logisticCalculator: _logisticCalculator),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          width: double.infinity,
          child: LogisticResultWidget(logistic: _logisticCalculator),
        ),
      ),
    );
  }
}
