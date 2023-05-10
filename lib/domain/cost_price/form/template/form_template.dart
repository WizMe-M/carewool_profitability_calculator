import 'package:mobx/mobx.dart';

import '../../../../database/entity/template.dart';
import '../cost_price_form.dart';

/// Editable template for [CostPriceForm].
///
/// Represents observable wrap on db entity [Template].
class FormTemplate {
  final String name;
  final ObservableMap<String, ObservableList<String>> structure;

  FormTemplate({
    required this.name,
    required this.structure,
  });

  factory FormTemplate.fromEntity({required Template template}) {
    return FormTemplate(
      name: template.name!,
      structure: ObservableMap.of({
        for (var templateBlock in template.blocks)
          templateBlock.name!: ObservableList.of(templateBlock.partNames)
      }),
    );
  }

  factory FormTemplate.standard() {
    return FormTemplate.fromEntity(
      template: Template()
        ..name = 'Шаблон по умолчанию'
        ..blocks = [
          TemplateBlock()
            ..name = 'Тара'
            ..partNames = ['Крышка', 'Дозатор', 'Флакон'],
          TemplateBlock()
            ..name = 'Упаковка'
            ..partNames = ['Этикетка', 'Коробка'],
          TemplateBlock()
            ..name = 'Производство'
            ..partNames = ['Розлив', 'Обклейка'],
          TemplateBlock()
            ..name = 'Логистика'
            ..partNames = ['От производства', 'До производства'],
        ],
    );
  }

  Template toEntity() {
    var template = Template()
      ..name = name
      ..blocks = [
        for (var entry in structure.entries)
          TemplateBlock()
            ..name = entry.key
            ..partNames = entry.value
      ];

    return template;
  }
}
