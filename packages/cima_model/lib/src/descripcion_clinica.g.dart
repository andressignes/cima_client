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

Map<String, dynamic> _$DescripcionClinicaToJson(DescripcionClinica instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vmp', instance.vmp);
  writeNotNull('vmpDesc', instance.vmpDesc);
  writeNotNull('vmpp', instance.vmpp);
  writeNotNull('vmppDesc', instance.vmppDesc);
  writeNotNull('presComerc', instance.presComerc);
  return val;
}
