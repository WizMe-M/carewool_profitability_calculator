import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../domain/cost_price/form/edit/edit_wrap.dart';
import '../side_bar.dart';
import 'cost_price/cost_price_form_widget.dart';
import 'cost_price/edit/edit_bottom_total_bar.dart';

@RoutePage()
class EditCostPricePage extends StatelessWidget {
  final EditWrap editWrap;

  const EditCostPricePage({required this.editWrap, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          editWrap.form.productName,
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: editWrap.resetChanges,
            icon: const Icon(Icons.delete),
            tooltip: 'Сбросить изменения',
          ),
        ],
      ),
      drawer: GetIt.I.get<SideBar>(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 28,
                  ),
                  child: Observer(
                    builder: (context) => CostPriceFormWidget(
                      form: editWrap.form,
                      isNameLocked: true,
                    ),
                  ),
                ),
              ),
            ),
            EditBottomTotalBar(editWrap: editWrap),
          ],
        ),
      ),
    );
  }
}
