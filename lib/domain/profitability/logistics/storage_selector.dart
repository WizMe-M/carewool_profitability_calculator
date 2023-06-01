import 'package:isar/isar.dart';
import 'package:mobx/mobx.dart';

import '../../../../database/entity/storage.dart';

part 'storage_selector.g.dart';

class StorageSelector = StorageSelectorBase with _$StorageSelector;

abstract class StorageSelectorBase with Store {
  final StorageUpload upload;

  @observable
  Storage? selected;

  StorageSelectorBase({required this.upload});

  StorageSelectorBase.fromSelected({required Storage storage})
      : upload = storage.upload.value!,
        selected = storage;

  Future<List<Storage>> search(String pattern) async {
    var words = Isar.splitWords(pattern);
    var searchResults = await upload.storages
        .filter()
        .allOf(words, (q, word) {
          return q.nameWordsElementStartsWith(word, caseSensitive: false);
        })
        .sortByName()
        .findAll();
    return searchResults;
  }
}
