// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problema_suministro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProblemaSuministro _$ProblemaSuministroFromJson(Map<String, dynamic> json) =>
    ProblemaSuministro(
      cn: json['cn'] as String?,
      nombre: json['nombre'] as String?,
      fini: json['fini'] as int?,
      ffin: json['ffin'] as int?,
      observ: json['observ'] as String?,
      activo: json['activo'] as bool?,
    );

Map<String, dynamic> _$ProblemaSuministroToJson(ProblemaSuministro instance) =>
    <String, dynamic>{
      'cn': instance.cn,
      'nombre': instance.nombre,
      'fini': instance.fini,
      'ffin': instance.ffin,
      'observ': instance.observ,
      'activo': instance.activo,
    };
