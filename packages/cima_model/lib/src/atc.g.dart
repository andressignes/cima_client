// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Atc _$AtcFromJson(Map<String, dynamic> json) => Atc(
      code: json['codigo'] as String,
      name: json['nombre'] as String,
      level: json['nivel'] as int,
    );

Map<String, dynamic> _$AtcToJson(Atc instance) => <String, dynamic>{
      'codigo': instance.code,
      'nombre': instance.name,
      'nivel': instance.level,
    };
