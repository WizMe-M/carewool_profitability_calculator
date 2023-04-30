// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryItem _$$_CategoryItemFromJson(Map<String, dynamic> json) =>
    _$_CategoryItem(
      name: json['name'] as String,
      fbo: (json['fbo'] as num).toDouble(),
      fbs: (json['fbs'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CategoryItemToJson(_$_CategoryItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fbo': instance.fbo,
      'fbs': instance.fbs,
    };
