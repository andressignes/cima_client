// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Foto _$FotoFromJson(Map<String, dynamic> json) => Foto(
      tipo: json['tipo'] as String?,
      url: json['url'] as String?,
      fecha: json['fecha'] as int?,
    );

Map<String, dynamic> _$FotoToJson(Foto instance) => <String, dynamic>{
      'tipo': instance.tipo,
      'url': instance.url,
      'fecha': instance.fecha,
    };
