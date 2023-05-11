import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/start_new_profitability/data_loader.dart';
import '../side_bar.dart';
import 'start_new_profitability/cost_price_selector_widget.dart';
import 'start_new_profitability/load_error_widget.dart';

@RoutePage()
class StartNewProfitabilityPage extends StatelessWidget {
  final DataLoader _loader = DataLoader();

  StartNewProfitabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Новый расчёт рентабельности'),
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: FutureBuilder(
          future: _loader.fetchData(),
          builder: (context, snapshot) {
            var errors = snapshot.data;
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (errors!.isNotEmpty) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: snapshot.data!
                    .map((error) => LoadErrorWidget(error: error))
                    .toList(),
              );
            } else {
              return CostPriceSelectorWidget(
                costPrices: _loader.costPrices,
                lastCommissionUpload: _loader.lastCommissionUpload!,
                lastStorageUpload: _loader.lastStorageUpload!,
              );
            }
          },
        ),
      ),
    );
  }
}
