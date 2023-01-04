// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_problems.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyProblems _$SupplyProblemsFromJson(Map<String, dynamic> json) =>
    SupplyProblems(
      nationalCode: json['cn'] as String,
      name: json['nombre'] as String,
      start: SupplyProblems._fromJson(json['fini'] as int?),
      end: SupplyProblems._fromJson(json['ffin'] as int?),
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

  writeNotNull('fini', SupplyProblems._toJson(instance.start));
  writeNotNull('ffin', SupplyProblems._toJson(instance.end));
  val['observ'] = instance.observations;
  val['activo'] = instance.active;
  return val;
}
