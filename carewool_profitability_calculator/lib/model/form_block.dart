import 'package:carewool_profitability_calculator/model/input_model.dart';
import 'package:decimal/decimal.dart';

class FormBlock {
  FormBlock({required this.title, required this.inputs});

  final String title;
  final List<InputModel> inputs;

  Decimal sumValues() {
    var sum = Decimal.zero;
    for (var input in inputs) {
      sum += input.value;
    }
    return sum;
  }
}
