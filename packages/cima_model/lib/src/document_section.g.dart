// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentSection _$DocumentSectionFromJson(Map<String, dynamic> json) =>
    DocumentSection(
      section: json['seccion'] as String?,
      title: json['titulo'] as String?,
      order: json['orden'] as int?,
      body: json['contenido'] as String?,
    );

Map<String, dynamic> _$DocumentSectionToJson(DocumentSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('seccion', instance.section);
  writeNotNull('titulo', instance.title);
  writeNotNull('orden', instance.order);
  writeNotNull('contenido', instance.body);
  return val;
}
