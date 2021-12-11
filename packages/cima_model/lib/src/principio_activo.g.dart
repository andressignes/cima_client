// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principio_activo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrincipioActivo _$PrincipioActivoFromJson(Map<String, dynamic> json) =>
    PrincipioActivo(
      id: json['id'] as int?,
      codigo: json['codigo'] as String?,
      nombre: json['nombre'] as String?,
      cantidad: json['cantidad'] as String?,
      unidad: json['unidad'] as String?,
      orden: json['orden'] as int?,
    );

Map<String, dynamic> _$PrincipioActivoToJson(PrincipioActivo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nombre': instance.nombre,
      'cantidad': instance.cantidad,
      'unidad': instance.unidad,
      'orden': instance.orden,
    };
