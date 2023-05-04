import 'package:mobx/mobx.dart';

import '../../../entity/product/product.dart';
import '../cost_price_form.dart';

part 'edit_cost_price_form.g.dart';

class EditWrapCostPriceForm = EditWrapCostPriceFormBase
    with _$EditWrapCostPriceForm;

abstract class EditWrapCostPriceFormBase with Store {
  final Product savedProduct;
  final int productId;

  @observable
  CostPriceForm form;

  EditWrapCostPriceFormBase({
    required this.savedProduct,
    required this.productId,
  }) : form = CostPriceForm.fromProduct(product: savedProduct);

  @action
  void resetChanges() {
    form = CostPriceForm.fromProduct(product: savedProduct);
  }
}
