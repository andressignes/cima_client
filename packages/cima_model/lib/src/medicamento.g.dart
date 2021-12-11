// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicamento _$MedicamentoFromJson(Map<String, dynamic> json) => Medicamento(
      nregistro: json['nregistro'] as String?,
      nombre: json['nombre'] as String?,
      pactivos: json['pactivos'] as String?,
      labtitular: json['labtitular'] as String?,
      estado: json['estado'] == null
          ? null
          : Estado.fromJson(json['estado'] as Map<String, dynamic>),
      cpresc: json['cpresc'] as String?,
      comerc: json['comerc'] as bool?,
      conduc: json['conduc'] as bool?,
      triangulo: json['triangulo'] as bool?,
      huerfano: json['huerfano'] as bool?,
      biosimilar: json['biosimilar'] as bool?,
      ema: json['ema'] as bool?,
      psum: json['psum'] as bool?,
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => Documento.fromJson(e as Map<String, dynamic>))
          .toList(),
      fotos: (json['fotos'] as List<dynamic>?)
          ?.map((e) => Foto.fromJson(e as Map<String, dynamic>))
          .toList(),
      notas: json['notas'] as bool?,
      materialesInf: json['materialesInf'] as bool?,
      atcs: (json['atcs'] as List<dynamic>?)
          ?.map((e) => Atc.fromJson(e as Map<String, dynamic>))
          .toList(),
      principiosActivos: (json['principiosActivos'] as List<dynamic>?)
          ?.map((e) => PrincipioActivo.fromJson(e as Map<String, dynamic>))
          .toList(),
      viasAdministracion: (json['viasAdministracion'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      nosustituible: json['nosustituible'] == null
          ? null
          : Item.fromJson(json['nosustituible'] as Map<String, dynamic>),
      presentaciones: (json['presentaciones'] as List<dynamic>?)
          ?.map((e) => Presentacion.fromJson(e as Map<String, dynamic>))
          .toList(),
      formaFarmaceutica: json['formaFarmaceutica'] == null
          ? null
          : Item.fromJson(json['formaFarmaceutica'] as Map<String, dynamic>),
      formaFarmaceuticaSimplificada: json['formaFarmaceuticaSimplificada'] ==
              null
          ? null
          : Item.fromJson(
              json['formaFarmaceuticaSimplificada'] as Map<String, dynamic>),
      dosis: json['dosis'] as String?,
    );

Map<String, dynamic> _$MedicamentoToJson(Medicamento instance) =>
    <String, dynamic>{
      'nregistro': instance.nregistro,
      'nombre': instance.nombre,
      'pactivos': instance.pactivos,
      'labtitular': instance.labtitular,
      'estado': instance.estado,
      'cpresc': instance.cpresc,
      'comerc': instance.comerc,
      'conduc': instance.conduc,
      'triangulo': instance.triangulo,
      'huerfano': instance.huerfano,
      'biosimilar': instance.biosimilar,
      'ema': instance.ema,
      'psum': instance.psum,
      'docs': instance.docs,
      'fotos': instance.fotos,
      'notas': instance.notas,
      'materialesInf': instance.materialesInf,
      'atcs': instance.atcs,
      'principiosActivos': instance.principiosActivos,
      'viasAdministracion': instance.viasAdministracion,
      'nosustituible': instance.nosustituible,
      'presentaciones': instance.presentaciones,
      'formaFarmaceutica': instance.formaFarmaceutica,
      'formaFarmaceuticaSimplificada': instance.formaFarmaceuticaSimplificada,
      'dosis': instance.dosis,
    };
