import 'package:freezed_annotation/freezed_annotation.dart';

import '../block/block.dart';

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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
