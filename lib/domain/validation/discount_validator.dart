import 'validator.dart';

class DiscountValidator extends Validator<String?> {
  @override
  Set<String> validate(String? object) {
    var errors = <String>{};
    if (object == null || object.isEmpty) return errors;

    var num = int.tryParse(object);
    if (num == null) {
      errors.add('Введите целое число');
    } else if (num < 0 || num >= 100) {
      errors.add('Процентное значение должно быть в диапазоне от 0 до 99');
    }

    return errors;
  }
}
