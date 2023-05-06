import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database/entity/template.dart';

part 'cost_price_form_template.freezed.dart';

@freezed
class CostPriceFormTemplate with _$CostPriceFormTemplate {
  const factory CostPriceFormTemplate({
    required String name,
    required Map<String, List<String>> structure,
  }) = _CostPriceFormTemplate;

  factory CostPriceFormTemplate.standard() {
    return const CostPriceFormTemplate(
      name: 'Шаблон по умолчанию',
      structure: {
        'Тара': ['Крышка', 'Дозатор', 'Флакон'],
        'Упаковка': ['Этикетка', 'Коробка'],
        'Производство': ['Розлив', 'Обклейка'],
        'Логистика': ['От производства', 'До производства'],
      },
    );
  }

  factory CostPriceFormTemplate.fromEntity({required Template template}) {
    return CostPriceFormTemplate(name: template.name, structure: {
      for (var templateBlock in template.blocks)
        templateBlock.name!: templateBlock.partNames!
    });
  }
}
