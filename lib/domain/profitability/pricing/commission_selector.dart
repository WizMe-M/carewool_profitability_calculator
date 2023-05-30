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

  Future<List<Commission>> search(String pattern) async {
    var words = Isar.splitWords(pattern);
    var searchResults = await upload.commissions
        .filter()
        .allOf(words, (q, word) {
          return q.tagWordsElementStartsWith(word, caseSensitive: false);
        })
        .sortByItemName()
        .findAll();
    return searchResults;
  }
}
