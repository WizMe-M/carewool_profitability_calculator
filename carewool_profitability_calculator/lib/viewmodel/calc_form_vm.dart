import 'package:carewool_profitability_calculator/viewmodel/form_block_vm.dart';
import 'package:carewool_profitability_calculator/viewmodel/input_vm.dart';
import 'package:decimal/decimal.dart';

class CalcFormViewModel {
  CalcFormViewModel._({required this.blocks});

  final List<FormBlockViewModel> blocks;

  factory CalcFormViewModel() {
    return CalcFormViewModel._(blocks: [
      FormBlockViewModel(
        title: 'Тара',
        inputs: [
          InputViewModel(label: 'Крышка'),
          InputViewModel(label: 'Дозатор'),
          InputViewModel(label: 'Флакон'),
        ],
      ),
      FormBlockViewModel(
        title: 'Упаковка',
        inputs: [
          InputViewModel(label: 'Этикетка'),
          InputViewModel(label: 'Коробка'),
        ],
      ),
      FormBlockViewModel(
        title: 'Производство',
        inputs: [
          InputViewModel(label: 'Розлив'),
          InputViewModel(label: 'Обклейка'),
        ],
      ),
      FormBlockViewModel(
        title: 'Логистика',
        inputs: [
          InputViewModel(label: 'Логистика от пр-ва'),
          InputViewModel(label: 'Логистика до пр-ва'),
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
