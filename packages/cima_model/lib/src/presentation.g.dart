// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presentation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Presentation _$PresentationFromJson(Map<String, dynamic> json) => Presentation(
      nationalCode: json['cn'] as String,
      name: json['nombre'] as String,
      status: MedicationStatus.fromJson(json['estado'] as Map<String, dynamic>),
      haveSupplyProblems: json['psum'] as bool,
      isCommercialized: json['comerc'] as bool,
    );

Map<String, dynamic> _$PresentationToJson(Presentation instance) =>
    <String, dynamic>{
      'cn': instance.nationalCode,
      'nombre': instance.name,
      'estado': instance.status,
      'comerc': instance.isCommercialized,
      'psum': instance.haveSupplyProblems,
    };
