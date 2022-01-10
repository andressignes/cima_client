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

Map<String, dynamic> _$DocumentoMaterialToJson(DocumentoMaterial instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nombre', instance.nombre);
  writeNotNull('url', instance.url);
  writeNotNull('fecha', instance.fecha);
  return val;
}
