// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_problems.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyProblems _$SupplyProblemsFromJson(Map<String, dynamic> json) =>
    SupplyProblems(
      nationalCode: json['cn'] as String,
      name: json['nombre'] as String,
      start:
          json['fini'] == null ? null : DateTime.parse(json['fini'] as String),
      end: json['ffin'] == null ? null : DateTime.parse(json['ffin'] as String),
      observations: json['observ'] as String? ?? '',
      active: json['activo'] as bool,
    );

Map<String, dynamic> _$SupplyProblemsToJson(SupplyProblems instance) {
  final val = <String, dynamic>{
    'cn': instance.nationalCode,
    'nombre': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fini', instance.start?.toIso8601String());
  writeNotNull('ffin', instance.end?.toIso8601String());
  val['observ'] = instance.observations;
  val['activo'] = instance.active;
  return val;
}
