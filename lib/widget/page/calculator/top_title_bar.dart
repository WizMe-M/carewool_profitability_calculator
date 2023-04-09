import 'package:carewool_profitability_calculator/viewmodel/form/product_calc_form.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CalcAppBar extends AppBar {
  CalcAppBar({super.key});

  @override
  State<CalcAppBar> createState() => _CalcAppBarState();
}

class _CalcAppBarState extends State<CalcAppBar> {
  final ProductFormStore _form = GetIt.I.get<ProductFormStore>();

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
