// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seccion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seccion _$SeccionFromJson(Map<String, dynamic> json) => Seccion(
      seccion: json['seccion'] as String?,
      titulo: json['titulo'] as String?,
      orden: json['orden'] as int?,
      contenido: json['contenido'] as String?,
    );

Map<String, dynamic> _$SeccionToJson(Seccion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('seccion', instance.seccion);
  writeNotNull('titulo', instance.titulo);
  writeNotNull('orden', instance.orden);
  writeNotNull('contenido', instance.contenido);
  return val;
}
