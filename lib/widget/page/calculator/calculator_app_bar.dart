import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../viewmodel/form/calculator_form.dart';

class CalculatorAppBar extends AppBar {
  CalculatorAppBar({super.key});

  @override
  State<CalculatorAppBar> createState() => _CalculatorAppBarState();
}

class _CalculatorAppBarState extends State<CalculatorAppBar> {
  final CalculatorForm _form = GetIt.I.get<CalculatorForm>();

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
              onTap: _form.reset,
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
