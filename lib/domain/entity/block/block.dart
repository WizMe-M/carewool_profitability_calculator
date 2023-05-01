import 'package:freezed_annotation/freezed_annotation.dart';

import '../parameter/parameter.dart';

part 'block.freezed.dart';

part 'block.g.dart';

@freezed
class Block with _$Block {
  factory Block({
    required String name,
    required List<Parameter> parameters,
  }) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) =>
      _$BlockFromJson(json);
}
