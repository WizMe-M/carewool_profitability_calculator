import 'package:carewool_profitability_calculator/widget/ruble_input_widget.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  Decimal _total = Decimal.zero;

  final _capController = TextEditingController();
  final _dispenserController = TextEditingController();
  final _bottleController = TextEditingController();
  final _stickerController = TextEditingController();
  final _boxController = TextEditingController();
  final _fillingController = TextEditingController();
  final _pastingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Калькулятор себестоимости'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          onChanged: () => setState(() => _countCost()),
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RubleInput(
                          controller: _capController,
                          labelText: 'Крышка',
                          validator: _validate,
                        ),
                        _space(15),
                        RubleInput(
                          controller: _dispenserController,
                          labelText: 'Дозатор',
                          validator: _validate,
                        ),
                        _space(15),
                        RubleInput(
                          controller: _bottleController,
                          labelText: 'Флакон',
                          validator: _validate,
                        ),
                        _space(15),
                        RubleInput(
                          controller: _stickerController,
                          labelText: 'Этикетка',
                          validator: _validate,
                        ),
                        _space(15),
                        RubleInput(
                          controller: _boxController,
                          labelText: 'Коробка',
                          validator: _validate,
                        ),
                        _space(15),
                        RubleInput(
                          controller: _fillingController,
                          labelText: 'Розлив',
                          validator: _validate,
                        ),
                        _space(15),
                        RubleInput(
                          controller: _pastingController,
                          labelText: 'Обклейка',
                          validator: _validate,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            const Text('Итого:'),
                            _space(4),
                            Text(
                              '$_total₽',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Save'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Reset'),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _space(double value) => SizedBox(width: value, height: value);

  bool _isValidNumber(String? s) =>
      (s != null && s.isNotEmpty && double.tryParse(s) == null);

  String? _validate(String? s) => _isValidNumber(s) ? 'Введите число' : null;

  void _countCost() {
    _total = Decimal.zero;
    _total += decimalFromString(_capController.text);
    _total += decimalFromString(_dispenserController.text);
    _total += decimalFromString(_bottleController.text);
    _total += decimalFromString(_stickerController.text);
    _total += decimalFromString(_boxController.text);
    _total += decimalFromString(_fillingController.text);
    _total += decimalFromString(_pastingController.text);
  }

  static Decimal decimalFromString(String s) =>
      Decimal.tryParse(s) ?? Decimal.zero;
}
