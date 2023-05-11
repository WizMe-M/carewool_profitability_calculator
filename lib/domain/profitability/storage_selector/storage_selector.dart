import 'package:mobx/mobx.dart';

import '../../../../database/entity/storage.dart';

part 'storage_selector.g.dart';

class StorageSelector = StorageSelectorBase with _$StorageSelector;

abstract class StorageSelectorBase with Store {
  final List<Storage> storages;

  @observable
  bool isInfoExpanded = false;

  @observable
  Storage? selected;

  StorageSelectorBase({required StorageUpload upload})
      : storages = upload.uploadedItems;
}
