// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_tariff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StorageTariff _$$_StorageTariffFromJson(Map<String, dynamic> json) =>
    _$_StorageTariff(
      storageName: json['storage_name'] as String,
      baseLogistic: (json['base_logistic'] as num).toDouble(),
      additionalLogistic: (json['additional_logistic'] as num).toDouble(),
      baseStoring: (json['base_storing'] as num?)?.toDouble(),
      additionalStoring: (json['additional_storing'] as num?)?.toDouble(),
      baseAcceptance: (json['base_acceptance'] as num?)?.toDouble(),
      additionalAcceptance: (json['additional_acceptance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_StorageTariffToJson(_$_StorageTariff instance) =>
    <String, dynamic>{
      'storage_name': instance.storageName,
      'base_logistic': instance.baseLogistic,
      'additional_logistic': instance.additionalLogistic,
      'base_storing': instance.baseStoring,
      'additional_storing': instance.additionalStoring,
      'base_acceptance': instance.baseAcceptance,
      'additional_acceptance': instance.additionalAcceptance,
    };
