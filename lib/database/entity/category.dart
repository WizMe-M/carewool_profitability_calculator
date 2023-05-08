import 'package:isar/isar.dart';

part 'category.g.dart';

@collection
class CategoryList {
  Id? id;
  List<Category> categories = [];
}

@embedded
class Category {
  String? name;
  List<Subcategory> subcategories = [];
}

@embedded
class Subcategory {
  String? name;
  double? fbo;
  double? fbs;
}
