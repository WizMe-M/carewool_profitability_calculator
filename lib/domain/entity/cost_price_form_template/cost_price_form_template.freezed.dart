// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost_price_form_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CostPriceFormTemplate _$CostPriceFormTemplateFromJson(
    Map<String, dynamic> json) {
  return _CostPriceFormTemplate.fromJson(json);
}

/// @nodoc
mixin _$CostPriceFormTemplate {
  Map<String, List<String>> get structure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
@JsonSerializable()
class _$_CostPriceFormTemplate implements _CostPriceFormTemplate {
  const _$_CostPriceFormTemplate(
      {required final Map<String, List<String>> structure})
      : _structure = structure;

  factory _$_CostPriceFormTemplate.fromJson(Map<String, dynamic> json) =>
      _$$_CostPriceFormTemplateFromJson(json);

  final Map<String, List<String>> _structure;
  @override
  Map<String, List<String>> get structure {
    if (_structure is EqualUnmodifiableMapView) return _structure;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_structure);
  }

  @override
  String toString() {
    return 'CostPriceFormTemplate(structure: $structure)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CostPriceFormTemplateToJson(
      this,
    );
  }
}

abstract class _CostPriceFormTemplate implements CostPriceFormTemplate {
  const factory _CostPriceFormTemplate(
          {required final Map<String, List<String>> structure}) =
      _$_CostPriceFormTemplate;

  factory _CostPriceFormTemplate.fromJson(Map<String, dynamic> json) =
      _$_CostPriceFormTemplate.fromJson;

  @override
  Map<String, List<String>> get structure;
}
