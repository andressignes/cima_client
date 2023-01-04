// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medication _$MedicationFromJson(Map<String, dynamic> json) => Medication(
      registerNumber: json['nregistro'] as String,
      name: json['nombre'] as String,
      activeIngredient: json['pactivos'] as String?,
      laboratory: json['labtitular'] as String?,
      status: json['estado'] == null
          ? null
          : MedicationStatus.fromJson(json['estado'] as Map<String, dynamic>),
      conditionPrescriptions: json['cpresc'] as String?,
      havePresentations: json['comerc'] as bool?,
      needPrescription: json['receta'] as bool?,
      isGeneric: json['generico'] as bool?,
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
      atc: (json['atcs'] as List<dynamic>?)
          ?.map((e) => Atc.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeIngredients: (json['principiosActivos'] as List<dynamic>?)
          ?.map((e) => PrincipioActivo.fromJson(e as Map<String, dynamic>))
          .toList(),
      excipients: (json['excipientes'] as List<dynamic>?)
          ?.map((e) => Excipient.fromJson(e as Map<String, dynamic>))
          .toList(),
      routesAdministration: (json['viasAdministracion'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeDrugNotSubstitutable: json['nosustituible'] == null
          ? null
          : Item.fromJson(json['nosustituible'] as Map<String, dynamic>),
      presentations: (json['presentaciones'] as List<dynamic>?)
          ?.map((e) => Presentation.fromJson(e as Map<String, dynamic>))
          .toList(),
      pharmaceuticalForm: json['formaFarmaceutica'] == null
          ? null
          : Item.fromJson(json['formaFarmaceutica'] as Map<String, dynamic>),
      pharmaceuticalFormSimplified: json['formaFarmaceuticaSimplificada'] ==
              null
          ? null
          : Item.fromJson(
              json['formaFarmaceuticaSimplificada'] as Map<String, dynamic>),
      vtm: json['vtm'] == null
          ? null
          : Item.fromJson(json['vtm'] as Map<String, dynamic>),
      dosage: json['dosis'] as String?,
    );

Map<String, dynamic> _$MedicationToJson(Medication instance) {
  final val = <String, dynamic>{
    'nregistro': instance.registerNumber,
    'nombre': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pactivos', instance.activeIngredient);
  writeNotNull('labtitular', instance.laboratory);
  writeNotNull('estado', instance.status?.toJson());
  writeNotNull('cpresc', instance.conditionPrescriptions);
  writeNotNull('comerc', instance.havePresentations);
  writeNotNull('receta', instance.needPrescription);
  writeNotNull('generico', instance.isGeneric);
  writeNotNull('conduc', instance.affectsDriving);
  writeNotNull('triangulo', instance.hasTriangle);
  writeNotNull('huerfano', instance.isOrphan);
  writeNotNull('biosimilar', instance.biosimilar);
  writeNotNull('ema', instance.isRegisteredByEMA);
  writeNotNull('psum', instance.haveSupplyProblems);
  writeNotNull('docs', instance.documents?.map((e) => e.toJson()).toList());
  writeNotNull('fotos', instance.photos?.map((e) => e.toJson()).toList());
  writeNotNull('notas', instance.notes);
  writeNotNull('materialesInf', instance.availableInformativeMaterials);
  writeNotNull('atcs', instance.atc?.map((e) => e.toJson()).toList());
  writeNotNull('principiosActivos',
      instance.activeIngredients?.map((e) => e.toJson()).toList());
  writeNotNull(
      'excipientes', instance.excipients?.map((e) => e.toJson()).toList());
  writeNotNull('viasAdministracion',
      instance.routesAdministration?.map((e) => e.toJson()).toList());
  writeNotNull('nosustituible', instance.typeDrugNotSubstitutable?.toJson());
  writeNotNull('presentaciones',
      instance.presentations?.map((e) => e.toJson()).toList());
  writeNotNull('formaFarmaceutica', instance.pharmaceuticalForm?.toJson());
  writeNotNull('formaFarmaceuticaSimplificada',
      instance.pharmaceuticalFormSimplified?.toJson());
  writeNotNull('vtm', instance.vtm?.toJson());
  writeNotNull('dosis', instance.dosage);
  return val;
}
