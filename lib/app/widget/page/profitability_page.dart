import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../side_bar.dart';

class ProfitabilityPage extends StatelessWidget {
  const ProfitabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор рентабельности')),
      drawer: GetIt.I.get<SideBar>(),
      body: const SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
