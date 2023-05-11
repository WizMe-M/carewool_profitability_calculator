import 'package:mobx/mobx.dart';

import '../../../database/entity/commission.dart';

part 'commission_selector.g.dart';

class CommissionSelector = CommissionSelectorBase with _$CommissionSelector;

abstract class CommissionSelectorBase with Store {
  final List<Commission> list;

  @observable
  Commission? selected;

  CommissionSelectorBase({required CommissionUpload upload})
      : list = upload.uploadedItems;

  @computed
  double get fbsCommission => selected?.fbs ?? 0;

  @computed
  double get fboCommission => selected?.fbo ?? 0;
}
