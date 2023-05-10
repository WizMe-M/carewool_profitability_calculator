import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/cost_price/form/cost_price_form.dart';
import 'cost_price_page.dart';

@RoutePage()
class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          return CostCalculatorPage(
            form: CostPriceForm.defaultTemplate(),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
