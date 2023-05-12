import 'package:isar/isar.dart';
import 'package:mobx/mobx.dart';

import '../../../database/entity/commission.dart';

part 'commission_selector.g.dart';

class CommissionSelector = CommissionSelectorBase with _$CommissionSelector;

abstract class CommissionSelectorBase with Store {
  final CommissionUpload upload;

  @observable
  Commission? selected;

  CommissionSelectorBase({required this.upload});

  @computed
  double get fbsCommission => selected?.fbs ?? 0;

  @computed
  double get fboCommission => selected?.fbo ?? 0;

  String get categoryName {
    return selected != null ? selected!.category! : 'Не выбрана';
  }

  Future<List<Commission>> search(String pattern) async {
    var words = Isar.splitWords(pattern);
    var searchResults = await upload.commissions
        .filter()
        .allOf(words, (q, word) => q.tagWordsElementContains(word))
        .sortByItemName()
        .findAll();
    return searchResults;
  }
}
