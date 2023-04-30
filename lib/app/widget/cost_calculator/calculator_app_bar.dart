import 'package:flutter/material.dart';

import '../../viewmodel/cost_calculator/form/cost_calculator_form.dart';

class CalculatorAppBar extends AppBar {
  final CostCalculatorForm form;

  CalculatorAppBar({required this.form, super.key});

  @override
  State<CalculatorAppBar> createState() => _CalculatorAppBarState();
}

class _CalculatorAppBarState extends State<CalculatorAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Калькулятор себестоимости',
        style: TextStyle(fontSize: 18),
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: widget.form.reset,
              height: 30,
              child: const ListTile(
                title: Text('Reset form'),
                leading: Icon(Icons.clear),
              ),
            ),
          ],
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
