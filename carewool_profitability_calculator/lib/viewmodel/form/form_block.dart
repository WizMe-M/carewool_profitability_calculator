import 'package:carewool_profitability_calculator/viewmodel/form/input.dart';
import 'package:dfunc/dfunc.dart';

class FormBlock {
  final String title;
  final List<Input> inputs;

  FormBlock({required this.title, required this.inputs});

  double calculateSum() => sum(inputs.map<double>((e) => e.value));
}
