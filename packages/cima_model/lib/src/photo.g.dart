// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      type: $enumDecode(_$PhotoTypeEnumMap, json['tipo']),
      url: Uri.parse(json['url'] as String),
      latestUpdate: Photo._fromJson(json['fecha'] as int),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'tipo': _$PhotoTypeEnumMap[instance.type]!,
      'url': instance.url.toString(),
      'fecha': Photo._toJson(instance.latestUpdate),
    };

const _$PhotoTypeEnumMap = {
  PhotoType.material: 'materialas',
  PhotoType.pharmaceuticalProduct: 'formafarmac',
};
