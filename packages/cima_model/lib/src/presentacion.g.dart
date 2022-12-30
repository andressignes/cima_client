// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentacion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Presentacion _$PresentacionFromJson(Map<String, dynamic> json) => Presentacion(
      cn: json['cn'] as String?,
      nombre: json['nombre'] as String?,
      estado: json['estado'] == null
          ? null
          : Estado.fromJson(json['estado'] as Map<String, dynamic>),
      comerc: json['comerc'] as bool?,
      psum: json['psum'] as bool?,
    );

Map<String, dynamic> _$PresentacionToJson(Presentacion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cn', instance.cn);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('estado', instance.estado);
  writeNotNull('comerc', instance.comerc);
  writeNotNull('psum', instance.psum);
  return val;
}
