// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresentationSummary _$PresentationSummaryFromJson(Map<String, dynamic> json) =>
    PresentationSummary(
      registrationNumber: json['nregistro'] as String,
      nationalCode: json['cn'] as String,
      name: json['nombre'] as String,
      status: MedicationStatus.fromJson(json['estado'] as Map<String, dynamic>),
      haveSupplyProblems: json['psum'] as bool,
      isCommercialized: json['comerc'] as bool,
      activeIngredient: json['pactivo'] as String,
      laboratory: json['labtitular'] as String,
      conditionPrescriptions: json['cpresc'] as String,
      affectsDriving: json['conduc'] as bool,
      hasTriangle: json['triangulo'] as bool,
      isOrphan: json['huerfano'] as bool,
      isRegisteredByEMA: json['ema'] as bool,
      documents: json['docs'] as String,
      haveNotes: json['notas'] as bool,
    );

Map<String, dynamic> _$PresentationSummaryToJson(
        PresentationSummary instance) =>
    <String, dynamic>{
      'nregistro': instance.registrationNumber,
      'cn': instance.nationalCode,
      'nombre': instance.name,
      'pactivo': instance.activeIngredient,
      'labtitular': instance.laboratory,
      'estado': instance.status.toJson(),
      'cpresc': instance.conditionPrescriptions,
      'comerc': instance.isCommercialized,
      'conduc': instance.affectsDriving,
      'triangulo': instance.hasTriangle,
      'huerfano': instance.isOrphan,
      'ema': instance.isRegisteredByEMA,
      'psum': instance.haveSupplyProblems,
      'docs': instance.documents,
      'notas': instance.haveNotes,
    };
