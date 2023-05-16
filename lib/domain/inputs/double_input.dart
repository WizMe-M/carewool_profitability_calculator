import '../validation/positive_double_validator.dart';
import '../validation/validator.dart';
import 'input.dart';

class DoubleInput extends Input<double> {
  final _validator = PositiveDoubleValidator();

  DoubleInput() : super();

  DoubleInput.withText(String text) : super.withText(text);

  @override
  double? parseInput() => double.tryParse(text);

  @override
  Validator<String?> get validator => _validator;

  @override
  double get defaultValue => 0;
}
