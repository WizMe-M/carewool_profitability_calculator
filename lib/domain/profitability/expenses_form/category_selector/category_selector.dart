import 'package:mobx/mobx.dart';

import '../../../../database/entity/category.dart';

part 'category_selector.g.dart';

class CategorySelector = CategorySelectorBase with _$CategorySelector;

abstract class CategorySelectorBase with Store {
  final List<Category> list;

  @observable
  Category? selectedCategory;

  @observable
  Subcategory? selectedSubcategory;

  CategorySelectorBase({required CategoryList categoryList})
      : list = categoryList.categories;

  @action
  void setSelectedCategory(Category value) {
    selectedCategory = value;
    selectedSubcategory = null;
  }

  @computed
  double get fboCommission => selectedSubcategory?.fbo ?? 0;
}
