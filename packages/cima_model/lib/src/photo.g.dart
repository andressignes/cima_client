// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      type: $enumDecode(_$PhotoTypeEnumMap, json['tipo']),
      url: Uri.parse(json['url'] as String),
      latestUpdate: DateTime.parse(json['fecha'] as String),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'tipo': _$PhotoTypeEnumMap[instance.type]!,
      'url': instance.url.toString(),
      'fecha': instance.latestUpdate.toIso8601String(),
    };

const _$PhotoTypeEnumMap = {
  PhotoType.material: 'materialas',
  PhotoType.pharmaceuticalProduct: 'formafarmac',
};
