import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../database/entity/cost_price.dart' as db;
import '../../cost_price/form/cost_price_form.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  Product._();

  double get total {
    return blocks.fold<double>(
      0,
      (previousValue, block) =>
          previousValue +
          block.parameters.fold(
            0,
            (previousValue, parameter) => previousValue + parameter.cost,
          ),
    );
  }

  factory Product({
    required String name,
    required DateTime savedDate,
    required List<Block> blocks,
  }) = _Product;

  factory Product.fromForm({required CostPriceForm form}) {
    var product = Product(
      name: form.productName,
      savedDate: DateTime.now().toUtc(),
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

  factory Product.fromEntity({required db.CostPrice entity}) {
    return Product(
      name: entity.productName,
      savedDate: entity.savedDate,
      blocks: entity.blocks
          .map(
            (block) => Block(
              name: block.name!,
              parameters: block.parts!
                  .map(
                    (part) => Parameter(name: part.name!, cost: part.cost!),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  // TODO: remove in case of Isar usage
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  db.CostPrice toEntity() {
    var costPrice = db.CostPrice(
        name,
        savedDate,
        blocks
            .map((block) => db.Block()
              ..name = block.name
              ..parts = block.parameters
                  .map((param) => db.Part()
                    ..name = param.name
                    ..cost = param.cost)
                  .toList())
            .toList(),
        total);
    return costPrice;
  }
}

@freezed
class Block with _$Block {
  factory Block({
    required String name,
    required List<Parameter> parameters,
  }) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}

@freezed
class Parameter with _$Parameter {
  factory Parameter({
    required String name,
    required double cost,
  }) = _Parameter;

  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);
}
