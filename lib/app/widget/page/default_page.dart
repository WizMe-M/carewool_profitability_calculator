import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import '../../viewmodel/cost_calculator/form/cost_calculator_form.dart';
import 'cost_calculator_page.dart';

@RoutePage()
class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          FlutterNativeSplash.remove();
          return CostCalculatorPage(
            form: CostCalculatorForm.defaultTemplate()..init(),
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }
}