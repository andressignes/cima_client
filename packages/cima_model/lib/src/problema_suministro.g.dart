// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problema_suministro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemaSuministro _$ProblemaSuministroFromJson(Map<String, dynamic> json) =>
    ProblemaSuministro(
      cn: json['cn'] as String?,
      nombre: json['nombre'] as String?,
      tipoProblemaSuministro: json['tipoProblemaSuministro'] as int?,
      fini: json['fini'] as int?,
      ffin: json['ffin'] as int?,
      observ: json['observ'] as String?,
      activo: json['activo'] as bool?,
    );

Map<String, dynamic> _$ProblemaSuministroToJson(ProblemaSuministro instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cn', instance.cn);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('tipoProblemaSuministro', instance.tipoProblemaSuministro);
  writeNotNull('fini', instance.fini);
  writeNotNull('ffin', instance.ffin);
  writeNotNull('observ', instance.observ);
  writeNotNull('activo', instance.activo);
  return val;
}
