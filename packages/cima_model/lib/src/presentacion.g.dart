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

Map<String, dynamic> _$PresentacionToJson(Presentacion instance) =>
    <String, dynamic>{
      'cn': instance.cn,
      'nombre': instance.nombre,
      'estado': instance.estado,
      'comerc': instance.comerc,
      'psum': instance.psum,
    };
