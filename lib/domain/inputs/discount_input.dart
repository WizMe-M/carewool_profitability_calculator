import '../validation/discount_validator.dart';
import '../validation/validator.dart';
import 'input.dart';

class DiscountInput extends Input<int> {
  final _validator = DiscountValidator();

  DiscountInput() : super();

  DiscountInput.withText(String text) : super.withText(text);

  @override
  int? parseInput() => int.tryParse(text);

  @override
  Validator<String?> get validator => _validator;

  @override
  int get defaultValue => 0;
}
