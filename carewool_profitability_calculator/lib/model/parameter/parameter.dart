import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameter.freezed.dart';

part 'parameter.g.dart';

@freezed
class Parameter with _$Parameter {
  factory Parameter({
    required String name,
    required double cost,
  }) = _Parameter;

  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);
}
