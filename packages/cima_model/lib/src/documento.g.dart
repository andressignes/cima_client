// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Documento _$DocumentoFromJson(Map<String, dynamic> json) => Documento(
      tipo: json['tipo'] as int?,
      url: json['url'] as String?,
      secc: json['secc'] as bool?,
    );

Map<String, dynamic> _$DocumentoToJson(Documento instance) => <String, dynamic>{
      'tipo': instance.tipo,
      'url': instance.url,
      'secc': instance.secc,
    };
