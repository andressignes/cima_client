// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialDocument _$MaterialDocumentFromJson(Map<String, dynamic> json) =>
    MaterialDocument(
      name: json['nombre'] as String,
      url: Uri.parse(json['url'] as String),
      lastUpdate: DateTime.parse(json['fecha'] as String),
    );

Map<String, dynamic> _$MaterialDocumentToJson(MaterialDocument instance) =>
    <String, dynamic>{
      'nombre': instance.name,
      'url': instance.url.toString(),
      'fecha': instance.lastUpdate.toIso8601String(),
    };
