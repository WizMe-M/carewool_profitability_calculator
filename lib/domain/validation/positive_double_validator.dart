import 'validator.dart';

class PositiveDoubleValidator implements Validator<String?> {
  @override
  String? validate(String? s) {
    if (s == null || s.isEmpty) return null;

    var num = double.tryParse(s);
    if (num == null) return 'Введите число';
    if (num <= 0) return 'Число должно быть больше нуля';

    return null;
  }
}
