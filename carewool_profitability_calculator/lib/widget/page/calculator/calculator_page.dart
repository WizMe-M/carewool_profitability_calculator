import 'package:carewool_profitability_calculator/widget/nav/side_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/bottom_totals_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/calc_form.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/change_name_widget.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/top_title_bar.dart';
import 'package:carewool_profitability_calculator/widget/util/space.dart';
import 'package:decimal/decimal.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _formChangedEvent = Event<Value<Decimal>>();
  final titleChangeEvent = Event<Value<String>>();
  final titleResetEvent = Event();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalcAppBar(
        titleChangeEvent: titleChangeEvent,
        titleResetEvent: titleResetEvent,
      ),
      drawer: const SideBar(),
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
                  child: Column(
                    children: [
                      ChangeNameWidget(
                        titleChangeEvent: titleChangeEvent,
                        titleResetEvent: titleResetEvent,
                      ),
                      const Space(16),
                      CalcForm(
                        formKey: _formKey,
                        formChangedEvent: _formChangedEvent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomTotalBar(
              recountEvent: _formChangedEvent,
              formKey: _formKey,
            )
          ],
        ),
      ),
    );
  }
}
