import 'package:flutter/material.dart';

import '../navigation/app_router.dart';

class App extends StatelessWidget {
  final AppRouter _router = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Калькулятор себестоимости',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
