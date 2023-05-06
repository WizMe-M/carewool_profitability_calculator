import 'package:mobx/mobx.dart';

import '../../../../database/entity/cost_price.dart';
import '../cost_price_form.dart';

part 'edit_wrap.g.dart';

class EditWrap = EditWrapBase with _$EditWrap;

abstract class EditWrapBase with Store {
  final CostPrice _costPrice;

  EditWrapBase({required CostPrice costPrice})
      : _costPrice = costPrice,
        form = CostPriceForm.fromEntity(costPrice: costPrice);

  @observable
  CostPriceForm form;

  @action
  void resetChanges() {
    form = CostPriceForm.fromEntity(costPrice: _costPrice);
  }

  CostPrice toEntity() =>
      form.toEntity()
        ..id = _costPrice.id;
}
