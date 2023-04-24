import 'package:carewool_profitability_calculator/navigation/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final AppRouter _router = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Profitability Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
