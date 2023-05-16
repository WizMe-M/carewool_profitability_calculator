import 'validator.dart';

class PositiveDoubleValidator extends Validator<String?> {
  @override
  Set<String> validate(String? object) {
    var errors = <String>{};
    if (object == null || object.isEmpty) return errors;

    var num = double.tryParse(object);
    if (num == null) {
      errors.add('Введите число');
    } else if (num <= 0) {
      errors.add('Число должно быть больше нуля');
    }

    return errors;
  }
}
