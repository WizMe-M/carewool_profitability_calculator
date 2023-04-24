import 'input.dart';

/// Логический блок формы
class FormBlock {
  /// Наименование блока
  final String title;

  /// Список полей блока
  final List<Input> inputs;

  FormBlock({required this.title, required this.inputs});
}
