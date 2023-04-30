// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_tariff.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StorageTariff _$StorageTariffFromJson(Map<String, dynamic> json) {
  return _StorageTariff.fromJson(json);
}

/// @nodoc
mixin _$StorageTariff {
  String get storageName => throw _privateConstructorUsedError;
  double get baseLogistic => throw _privateConstructorUsedError;
  double get additionalLogistic => throw _privateConstructorUsedError;
  double get baseStoring => throw _privateConstructorUsedError;
  double get additionalStoring => throw _privateConstructorUsedError;
  double get baseAcceptance => throw _privateConstructorUsedError;
  double get additionalAcceptance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_StorageTariff implements _StorageTariff {
  _$_StorageTariff(
      {required this.storageName,
      required this.baseLogistic,
      required this.additionalLogistic,
      required this.baseStoring,
      required this.additionalStoring,
      required this.baseAcceptance,
      required this.additionalAcceptance});

  factory _$_StorageTariff.fromJson(Map<String, dynamic> json) =>
      _$$_StorageTariffFromJson(json);

  @override
  final String storageName;
  @override
  final double baseLogistic;
  @override
  final double additionalLogistic;
  @override
  final double baseStoring;
  @override
  final double additionalStoring;
  @override
  final double baseAcceptance;
  @override
  final double additionalAcceptance;

  @override
  String toString() {
    return 'StorageTariff(storageName: $storageName, baseLogistic: $baseLogistic, additionalLogistic: $additionalLogistic, baseStoring: $baseStoring, additionalStoring: $additionalStoring, baseAcceptance: $baseAcceptance, additionalAcceptance: $additionalAcceptance)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_StorageTariffToJson(
      this,
    );
  }
}

abstract class _StorageTariff implements StorageTariff {
  factory _StorageTariff(
      {required final String storageName,
      required final double baseLogistic,
      required final double additionalLogistic,
      required final double baseStoring,
      required final double additionalStoring,
      required final double baseAcceptance,
      required final double additionalAcceptance}) = _$_StorageTariff;

  factory _StorageTariff.fromJson(Map<String, dynamic> json) =
      _$_StorageTariff.fromJson;

  @override
  String get storageName;
  @override
  double get baseLogistic;
  @override
  double get additionalLogistic;
  @override
  double get baseStoring;
  @override
  double get additionalStoring;
  @override
  double get baseAcceptance;
  @override
  double get additionalAcceptance;
}
