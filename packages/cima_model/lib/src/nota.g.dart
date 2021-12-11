// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nota _$NotaFromJson(Map<String, dynamic> json) => Nota(
      tipo: json['tipo'] as int?,
      num: json['num'] as String?,
      ref: json['ref'] as String?,
      asunto: json['asunto'] as String?,
      fecha: json['fecha'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NotaToJson(Nota instance) => <String, dynamic>{
      'tipo': instance.tipo,
      'num': instance.num,
      'ref': instance.ref,
      'asunto': instance.asunto,
      'fecha': instance.fecha,
      'url': instance.url,
    };
