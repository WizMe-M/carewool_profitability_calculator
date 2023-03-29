import 'package:carewool_profitability_calculator/model/calc_form.dart';
import 'package:carewool_profitability_calculator/widget/util/ruble_input_widget.dart';
import 'package:carewool_profitability_calculator/widget/util/space.dart';
import 'package:decimal/decimal.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';

class CalcFormWidget extends StatelessWidget {
  CalcFormWidget({
    Key? key,
    required this.formKey,
    required this.formChangedEvent,
  }) : super(key: key);

  final _calcForm = CalcForm();
  final GlobalKey<FormState> formKey;
  final Event<Value<Decimal>> formChangedEvent;

  bool _isValidNumber(String? s) =>
      (s != null && s.isNotEmpty && double.tryParse(s) == null);

  String? _validate(String? s) => _isValidNumber(s) ? 'Введите число' : null;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      onChanged: () {
        var total = _calcForm.sumValues();
        formChangedEvent.broadcast(Value(total));
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RubleInput(
            controller: _calcForm.capController,
            labelText: 'Крышка',
            validator: _validate,
            autofocus: true,
          ),
          const Space(16),
          RubleInput(
            controller: _calcForm.dispenserController,
            labelText: 'Дозатор',
            validator: _validate,
          ),
          const Space(16),
          RubleInput(
            controller: _calcForm.bottleController,
            labelText: 'Флакон',
            validator: _validate,
          ),
          const Space(16),
          RubleInput(
            controller: _calcForm.stickerController,
            labelText: 'Этикетка',
            validator: _validate,
          ),
          const Space(16),
          RubleInput(
            controller: _calcForm.boxController,
            labelText: 'Коробка',
            validator: _validate,
          ),
          const Space(16),
          RubleInput(
            controller: _calcForm.fillingController,
            labelText: 'Розлив',
            validator: _validate,
          ),
          const Space(16),
          RubleInput(
            controller: _calcForm.pastingController,
            labelText: 'Обклейка',
            validator: _validate,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
