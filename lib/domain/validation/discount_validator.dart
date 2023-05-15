import 'validator.dart';

class DiscountValidator implements Validator<String?> {
  @override
  String? validate(String? s) {
    if (s == null || s.isEmpty) return null;

    var num = int.tryParse(s);
    if (num == null) return 'Введите целое число';
    if (num < 0 || num >= 100) {
      return 'Процентное значение должно быть в диапазоне от 0 до 99';
    }

    return null;
  }
}
