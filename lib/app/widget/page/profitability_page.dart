import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../database/entity/commission.dart';
import '../../../database/entity/cost_price.dart';
import '../../../database/entity/storage.dart';
import '../../../domain/profitability/profitability_form.dart';
import '../side_bar.dart';
import 'profitability/pricing/pricing_form_widget.dart';
import 'profitability/result/logistic_result_widget.dart';
import 'profitability/size/size_form_widget.dart';
import 'profitability/selector/storage/storage_selector_widget.dart';
import 'profitability/result/calculations_result_widget.dart';
import 'profitability/selector/commission_selector_widget.dart';
import 'profitability/selector/tax_selector_widget.dart';

@RoutePage()
class ProfitabilityPage extends StatelessWidget {
  final ProfitabilityForm _form;
  final CostPrice costPrice;

  ProfitabilityPage({
    required this.costPrice,
    required CommissionUpload lastCommissionUpload,
    required StorageUpload lastStorageUpload,
    super.key,
  }) : _form = ProfitabilityForm(
          costPrice: costPrice,
          commissions: lastCommissionUpload,
          storages: lastStorageUpload,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Калькулятор рентабельности'),
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StorageSelectorWidget(selector: _form.storageSelector),
                SizeFormWidget(form: _form.sizeForm),
                LogisticResultWidget(profitabilityForm: _form),
                CommissionSelectorWidget(selector: _form.categorySelector),
                PricingFormWidget(form: _form.pricingForm),
                TaxSelectorWidget(form: _form),
                CalculationsResultWidget(form: _form),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
