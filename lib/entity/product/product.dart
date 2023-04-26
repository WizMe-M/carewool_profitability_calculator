import 'package:dfunc/dfunc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../block/block.dart';
import '../parameter/parameter.dart';
import '../../viewmodel/cost_calculator/form/cost_calculator_form.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String name,
    @JsonKey(name: 'saved_date') required DateTime savedDate,
    required List<Block> blocks,
    required double total,
  }) = _Product;

  factory Product.fromForm({required CostCalculatorForm form}) {
    var product = Product(
      name: form.name,
      savedDate: DateTime.now().toUtc(),
      total: sum(form.allInputs.map<double>((e) => e.value)),
      blocks: form.blocks.map((block) {
        return Block(
          name: block.title,
          parameters: block.inputs.map((input) {
            return Parameter(name: input.label, cost: input.value);
          }).toList(),
        );
      }).toList(),
    );
    return product;
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
