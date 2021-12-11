// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'descripcion_clinica.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescripcionClinica _$DescripcionClinicaFromJson(Map<String, dynamic> json) =>
    DescripcionClinica(
      vmp: json['vmp'] as String?,
      vmpDec: json['vmpDec'] as String?,
      vmpp: json['vmpp'] as String?,
      vmppDesc: json['vmppDesc'] as String?,
      presComerc: json['presComerc'] as int?,
    );

Map<String, dynamic> _$DescripcionClinicaToJson(DescripcionClinica instance) =>
    <String, dynamic>{
      'vmp': instance.vmp,
      'vmpDec': instance.vmpDec,
      'vmpp': instance.vmpp,
      'vmppDesc': instance.vmppDesc,
      'presComerc': instance.presComerc,
    };
