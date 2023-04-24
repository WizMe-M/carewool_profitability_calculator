import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'page/calculator/calculator_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profitability Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: GetIt.I.allReady(),
        builder: (context, snapshot) => snapshot.hasData
            ? CalculatorPage()
            : const Scaffold(
                body: SafeArea(
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
