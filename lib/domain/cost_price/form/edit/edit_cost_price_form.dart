import 'package:mobx/mobx.dart';

import '../../../../database/entity/cost_price.dart';
import '../../../entity/product/product.dart';
import '../cost_price_form.dart';

part 'edit_cost_price_form.g.dart';

class EditWrapCostPriceForm = EditWrapCostPriceFormBase
    with _$EditWrapCostPriceForm;

abstract class EditWrapCostPriceFormBase with Store {
  CostPrice costPrice;

  @observable
  CostPriceForm form;

  EditWrapCostPriceFormBase({
    required this.costPrice,
  }) : form = CostPriceForm.fromProduct(
          product: Product.fromEntity(entity: costPrice),
        );

  @action
  void resetChanges() {
    form = CostPriceForm.fromProduct(
      product: Product.fromEntity(entity: costPrice),
    );
  }
}
