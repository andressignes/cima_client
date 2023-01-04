// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
      title: json['medicamento'] as String?,
      activeIngredients: json['principiosActivos'] as String?,
      patientDocuments: (json['listaDocsPaciente'] as List<dynamic>?)
          ?.map((e) => MaterialDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      practitionerDocuments: (json['listaDocsProfesional'] as List<dynamic>?)
          ?.map((e) => MaterialDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialToJson(Material instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('medicamento', instance.title);
  writeNotNull('principiosActivos', instance.activeIngredients);
  writeNotNull('listaDocsPaciente',
      instance.patientDocuments?.map((e) => e.toJson()).toList());
  writeNotNull('listaDocsProfesional',
      instance.practitionerDocuments?.map((e) => e.toJson()).toList());
  return val;
}
