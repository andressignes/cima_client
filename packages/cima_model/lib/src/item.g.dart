// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int,
      code: json['codigo'] as String?,
      name: json['nombre'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('codigo', instance.code);
  writeNotNull('nombre', instance.name);
  return val;
}
