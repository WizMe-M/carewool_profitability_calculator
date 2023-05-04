// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      name: json['name'] as String,
      savedDate: DateTime.parse(json['saved_date'] as String),
      blocks: (json['blocks'] as List<dynamic>)
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'name': instance.name,
      'saved_date': instance.savedDate.toIso8601String(),
      'blocks': instance.blocks.map((e) => e.toJson()).toList(),
    };

_$_Block _$$_BlockFromJson(Map<String, dynamic> json) => _$_Block(
      name: json['name'] as String,
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BlockToJson(_$_Block instance) => <String, dynamic>{
      'name': instance.name,
      'parameters': instance.parameters.map((e) => e.toJson()).toList(),
    };

_$_Parameter _$$_ParameterFromJson(Map<String, dynamic> json) => _$_Parameter(
      name: json['name'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ParameterToJson(_$_Parameter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cost': instance.cost,
    };
