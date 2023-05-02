import 'package:mobx/mobx.dart';

import 'size_form/size_form.dart';
import '../../entity/storage_tariff/storage_tariff.dart';

part 'logistic_form.g.dart';

class LogisticForm = LogisticFormBase with _$LogisticForm;

abstract class LogisticFormBase with Store {
  final SizeForm sizeForm = SizeForm();

  final storageTariffs = <StorageTariff>[
    StorageTariff(
      storageName: 'Базовый тариф',
      baseLogistic: 50,
      additionalLogistic: 5,
      baseStoring: 0.1,
      additionalStoring: 0.01,
      baseAcceptance: 15,
      additionalAcceptance: 1.5,
    ),
    StorageTariff(
      storageName: 'Чехов 1, Новоселки вл 11 стр 5',
      baseLogistic: 74,
      additionalLogistic: 7.4,
      baseStoring: 0.076,
      additionalStoring: 0.007,
      baseAcceptance: 0,
      additionalAcceptance: 0,
    ),
  ];

  @observable
  StorageTariff? selectedTariff;
}
