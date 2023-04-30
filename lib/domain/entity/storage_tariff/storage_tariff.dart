import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_tariff.g.dart';

part 'storage_tariff.freezed.dart';

@freezed
class StorageTariff with _$StorageTariff {
  factory StorageTariff({
    required String storageName,
    required double baseLogistic,
    required double additionalLogistic,
    required double baseStoring,
    required double additionalStoring,
    required double baseAcceptance,
    required double additionalAcceptance,
  }) = _StorageTariff;

  factory StorageTariff.fromJson(Map<String, dynamic> json) =>
      _$StorageTariffFromJson(json);
}
