import 'package:carewool_profitability_calculator/viewmodel/input_vm.dart';
import 'package:decimal/decimal.dart';

class FormBlockViewModel {
  FormBlockViewModel({required this.title, required this.inputs});

  final String title;
  final List<InputViewModel> inputs;

  Decimal sumValues() {
    var sum = Decimal.zero;
    for (var input in inputs) {
      sum += input.value;
    }
    return sum;
  }
}
