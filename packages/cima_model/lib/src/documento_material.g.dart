// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documento_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentoMaterial _$DocumentoMaterialFromJson(Map<String, dynamic> json) =>
    DocumentoMaterial(
      nombre: json['nombre'] as String?,
      url: json['url'] as String?,
      fecha: json['fecha'] as int?,
    );

Map<String, dynamic> _$DocumentoMaterialToJson(DocumentoMaterial instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'url': instance.url,
      'fecha': instance.fecha,
    };
