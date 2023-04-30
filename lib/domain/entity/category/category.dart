import 'package:freezed_annotation/freezed_annotation.dart';

import '../category_item/category_item.dart';

part 'category.g.dart';

part 'category.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Category with _$Category {
  factory Category({
    required String name,
    required List<CategoryItem> items,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
