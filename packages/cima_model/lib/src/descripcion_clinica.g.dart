// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descripcion_clinica.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescripcionClinica _$DescripcionClinicaFromJson(Map<String, dynamic> json) =>
    DescripcionClinica(
      vmp: json['vmp'] as String?,
      vmpDesc: json['vmpDesc'] as String?,
      vmpp: json['vmpp'] as String?,
      vmppDesc: json['vmppDesc'] as String?,
      presComerc: json['presComerc'] as int?,
    );

Map<String, dynamic> _$DescripcionClinicaToJson(DescripcionClinica instance) =>
    <String, dynamic>{
      'vmp': instance.vmp,
      'vmpDesc': instance.vmpDesc,
      'vmpp': instance.vmpp,
      'vmppDesc': instance.vmppDesc,
      'presComerc': instance.presComerc,
    };
