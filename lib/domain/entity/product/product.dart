import 'package:dfunc/dfunc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../block/block.dart';
import '../parameter/parameter.dart';
import '../../../app/viewmodel/cost_price/form/cost_price_form.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String name,
    required DateTime savedDate,
    required List<Block> blocks,
    required double total,
  }) = _Product;

  factory Product.fromForm({required CostPriceForm form}) {
    var product = Product(
      name: form.productName,
      savedDate: DateTime.now().toUtc(),
      total: sum(form.allInputs.map<double>((e) => e.value)),
      blocks: [
        for (var formBlock in form.blocks)
          Block(
            name: formBlock.title,
            parameters: [
              for (var input in formBlock.inputs)
                Parameter(name: input.label, cost: input.value),
            ],
          ),
      ],
    );
    return product;
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
