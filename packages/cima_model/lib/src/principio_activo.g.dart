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

Map<String, dynamic> _$PrincipioActivoToJson(PrincipioActivo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('codigo', instance.codigo);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('cantidad', instance.cantidad);
  writeNotNull('unidad', instance.unidad);
  writeNotNull('orden', instance.orden);
  return val;
}
