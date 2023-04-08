import 'package:carewool_profitability_calculator/viewmodel/form/product_calc_form.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/form_block.dart';
import 'package:carewool_profitability_calculator/viewmodel/form/input.dart';
import 'package:carewool_profitability_calculator/widget/nav/side_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/bottom_total_bar.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/form/calc_form.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/change_name_widget.dart';
import 'package:carewool_profitability_calculator/widget/page/calculator/top_title_bar.dart';
import 'package:carewool_profitability_calculator/widget/util/space.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  final titleChangeEvent = Event<Value<String>>();
  final titleResetEvent = Event();

  CalculatorPage({super.key});

  final ProductCalcForm _productCalcForm = ProductCalcForm(
    blocks: [
      FormBlock(
        title: 'Тара',
        inputs: [
          Input(label: 'Крышка'),
          Input(label: 'Дозатор'),
          Input(label: 'Флакон'),
        ],
      ),
      FormBlock(
        title: 'Упаковка',
        inputs: [
          Input(label: 'Этикетка'),
          Input(label: 'Коробка'),
        ],
      ),
      FormBlock(
        title: 'Производство',
        inputs: [
          Input(label: 'Розлив'),
          Input(label: 'Обклейка'),
        ],
      ),
      FormBlock(
        title: 'Логистика',
        inputs: [
          Input(label: 'Логистика от пр-ва'),
          Input(label: 'Логистика до пр-ва'),
        ],
      ),
    ],
  )..init();

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
                      CalcFormWidget(form: _productCalcForm),
                    ],
                  ),
                ),
              ),
            ),
            BottomTotalBar(form: _productCalcForm),
          ],
        ),
      ),
    );
  }
}
