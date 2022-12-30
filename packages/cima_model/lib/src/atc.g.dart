// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Atc _$AtcFromJson(Map<String, dynamic> json) => Atc(
      codigo: json['codigo'] as String?,
      nombre: json['nombre'] as String?,
      nivel: json['nivel'] as int?,
    );

Map<String, dynamic> _$AtcToJson(Atc instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('codigo', instance.codigo);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('nivel', instance.nivel);
  return val;
}
