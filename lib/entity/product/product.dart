// ignore_for_file: invalid_annotation_target

import 'package:carewool_profitability_calculator/entity/parameter/parameter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@freezed
class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  factory Product({
    required String name,
    @JsonKey(name: 'creation_date') required DateTime creationDate,
    required List<Parameter> parameters,
    required double total,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
