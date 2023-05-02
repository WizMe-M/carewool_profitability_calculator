import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_price_form_template.freezed.dart';

part 'cost_price_form_template.g.dart';

@freezed
class CostPriceFormTemplate with _$CostPriceFormTemplate {
  const factory CostPriceFormTemplate({
    required Map<String, List<String>> structure,
  }) = _CostPriceFormTemplate;

  factory CostPriceFormTemplate.standard() {
    return const CostPriceFormTemplate(
      structure: {
        'Тара': ['Крышка', 'Дозатор', 'Флакон'],
        'Упаковка': ['Этикетка', 'Коробка'],
        'Производство': ['Розлив', 'Обклейка'],
        'Логистика': ['От производства', 'До производства'],
      },
    );
  }

  factory CostPriceFormTemplate.fromJson(Map<String, dynamic> json) =>
      _$CostPriceFormTemplateFromJson(json);
}
