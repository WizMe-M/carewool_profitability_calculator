import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../database/entity/cost_price.dart';
import '../../../database/entity/upload.dart';
import '../../../domain/profitability/profitability_form.dart';
import '../side_bar.dart';
import 'logistic/logistic_result_widget.dart';
import 'logistic/size_form_widget.dart';
import 'logistic/storage_selector_widget.dart';
import 'profitability/calculations_result_widget.dart';
import 'profitability/category_selector_widget.dart';
import 'profitability/sale_price_widget.dart';
import 'profitability/tax_selector_widget.dart';

@RoutePage()
class ProfitabilityPage extends StatelessWidget {
  final ProfitabilityForm _form;
  final CostPrice costPrice;

  ProfitabilityPage({
    required this.costPrice,
    required Upload lastUpload,
    super.key,
  }) : _form = ProfitabilityForm(costPrice: costPrice, upload: lastUpload);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Калькулятор рентабельности'),
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StorageSelectorWidget(selector: _form.storageSelector),
                  SizeFormWidget(form: _form.sizeForm),
                  LogisticResultWidget(profitabilityForm: _form),
                  CategorySelectorWidget(selector: _form.categorySelector),
                  SalePriceWidget(
                    desiredCostInput: _form.desiredCost,
                    discountInput: _form.discount,
                  ),
                  TaxSelectorWidget(form: _form),
                  CalculationsResultWidget(form: _form),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
