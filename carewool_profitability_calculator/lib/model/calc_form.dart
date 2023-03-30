import 'package:carewool_profitability_calculator/model/form_block.dart';
import 'package:carewool_profitability_calculator/model/input_model.dart';
import 'package:decimal/decimal.dart';

class CalcForm {
  CalcForm._({required this.blocks});

  final List<FormBlock> blocks;

  factory CalcForm() {
    return CalcForm._(blocks: [
      FormBlock(
        title: 'Тара',
        inputs: [
          InputModel(label: 'Крышка'),
          InputModel(label: 'Дозатор'),
          InputModel(label: 'Флакон'),
        ],
      ),
      FormBlock(
        title: 'Упаковка',
        inputs: [
          InputModel(label: 'Этикетка'),
          InputModel(label: 'Коробка'),
        ],
      ),
      FormBlock(
        title: 'Производство',
        inputs: [
          InputModel(label: 'Розлив'),
          InputModel(label: 'Обклейка'),
        ],
      ),
      FormBlock(
        title: 'Логистика',
        inputs: [
          InputModel(label: 'Логистика от пр-ва'),
          InputModel(label: 'Логистика до пр-ва'),
        ],
      ),
    ]);
  }

  Decimal sumValues() {
    var sum = Decimal.zero;
    for (var block in blocks) {
      sum += block.sumValues();
    }
    return sum;
  }
}
