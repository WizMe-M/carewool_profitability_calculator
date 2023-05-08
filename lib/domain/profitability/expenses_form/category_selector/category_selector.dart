import 'package:mobx/mobx.dart';

import '../../../../database/entity/category.dart';

part 'category_selector.g.dart';

class CategorySelector = CategorySelectorBase with _$CategorySelector;

abstract class CategorySelectorBase with Store {
  final List<Category> list;

  @observable
  Category? category;

  @observable
  Subcategory? subcategory;

  CategorySelectorBase({required CategoryList categoryList})
      : list = categoryList.categories;

  @action
  void setSelectedCategory(Category? value) {
    category = value;
    subcategory = null;
  }

  @computed
  double get fbsCommission => subcategory?.fbs ?? 0;
}
