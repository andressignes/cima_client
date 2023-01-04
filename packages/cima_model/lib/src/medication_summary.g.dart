// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationSummary _$MedicationSummaryFromJson(Map<String, dynamic> json) =>
    MedicationSummary(
      registerNumber: json['nregistro'] as String,
      name: json['nombre'] as String,
      laboratory: json['labtitular'] as String?,
      status: json['estado'] == null
          ? null
          : MedicationStatus.fromJson(json['estado'] as Map<String, dynamic>),
      conditionPrescriptions: json['cpresc'] as String?,
      havePresentations: json['comerc'] as bool?,
      needPrescription: json['receta'] as bool?,
      affectsDriving: json['conduc'] as bool?,
      hasTriangle: json['triangulo'] as bool?,
      isOrphan: json['huerfano'] as bool?,
      biosimilar: json['biosimilar'] as bool?,
      isRegisteredByEMA: json['ema'] as bool?,
      haveSupplyProblems: json['psum'] as bool?,
      documents: (json['docs'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
      photos: (json['fotos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notas'] as bool?,
      availableInformativeMaterials: json['materialesInf'] as bool?,
      routesAdministration: (json['viasAdministracion'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeDrugNotSubstitutable: json['nosustituible'] == null
          ? null
          : Item.fromJson(json['nosustituible'] as Map<String, dynamic>),
      pharmaceuticalForm: json['formaFarmaceutica'] == null
          ? null
          : Item.fromJson(json['formaFarmaceutica'] as Map<String, dynamic>),
      pharmaceuticalFormSimplified: json['formaFarmaceuticaSimplificada'] ==
              null
          ? null
          : Item.fromJson(
              json['formaFarmaceuticaSimplificada'] as Map<String, dynamic>),
      dosage: json['dosis'] as String?,
    );

Map<String, dynamic> _$MedicationSummaryToJson(MedicationSummary instance) {
  final val = <String, dynamic>{
    'nregistro': instance.registerNumber,
    'nombre': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('labtitular', instance.laboratory);
  writeNotNull('estado', instance.status?.toJson());
  writeNotNull('cpresc', instance.conditionPrescriptions);
  writeNotNull('comerc', instance.havePresentations);
  writeNotNull('receta', instance.needPrescription);
  writeNotNull('conduc', instance.affectsDriving);
  writeNotNull('triangulo', instance.hasTriangle);
  writeNotNull('huerfano', instance.isOrphan);
  writeNotNull('biosimilar', instance.biosimilar);
  writeNotNull('nosustituible', instance.typeDrugNotSubstitutable?.toJson());
  writeNotNull('psum', instance.haveSupplyProblems);
  writeNotNull('ema', instance.isRegisteredByEMA);
  writeNotNull('notas', instance.notes);
  writeNotNull('materialesInf', instance.availableInformativeMaterials);
  writeNotNull('docs', instance.documents?.map((e) => e.toJson()).toList());
  writeNotNull('fotos', instance.photos?.map((e) => e.toJson()).toList());
  writeNotNull('viasAdministracion',
      instance.routesAdministration?.map((e) => e.toJson()).toList());
  writeNotNull('formaFarmaceutica', instance.pharmaceuticalForm?.toJson());
  writeNotNull('formaFarmaceuticaSimplificada',
      instance.pharmaceuticalFormSimplified?.toJson());
  writeNotNull('dosis', instance.dosage);
  return val;
}
