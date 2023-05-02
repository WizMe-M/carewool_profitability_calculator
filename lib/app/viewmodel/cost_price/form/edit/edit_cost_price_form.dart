import 'package:mobx/mobx.dart';

import '../cost_price_form.dart';
import '../../../../../domain/entity/product/product.dart';

part 'edit_cost_price_form.g.dart';

class EditCostPriceForm = EditCostPriceFormBase with _$EditCostPriceForm;

abstract class EditCostPriceFormBase with Store {
  final Product savedProduct;
  final CostPriceForm form;

  EditCostPriceFormBase({required this.savedProduct})
      : form = CostPriceForm.fromProduct(product: savedProduct);

  @action
  void resetChanges() {}
}
