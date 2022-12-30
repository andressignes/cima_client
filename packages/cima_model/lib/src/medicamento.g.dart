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
      receta: json['receta'] as bool?,
      generico: json['generico'] as bool?,
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
      excipientes: (json['excipientes'] as List<dynamic>?)
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
      vtm: json['vtm'] == null
          ? null
          : Item.fromJson(json['vtm'] as Map<String, dynamic>),
      dosis: json['dosis'] as String?,
    );

Map<String, dynamic> _$MedicamentoToJson(Medicamento instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nregistro', instance.nregistro);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('pactivos', instance.pactivos);
  writeNotNull('labtitular', instance.labtitular);
  writeNotNull('estado', instance.estado);
  writeNotNull('cpresc', instance.cpresc);
  writeNotNull('comerc', instance.comerc);
  writeNotNull('receta', instance.receta);
  writeNotNull('generico', instance.generico);
  writeNotNull('conduc', instance.conduc);
  writeNotNull('triangulo', instance.triangulo);
  writeNotNull('huerfano', instance.huerfano);
  writeNotNull('biosimilar', instance.biosimilar);
  writeNotNull('ema', instance.ema);
  writeNotNull('psum', instance.psum);
  writeNotNull('docs', instance.docs);
  writeNotNull('fotos', instance.fotos);
  writeNotNull('notas', instance.notas);
  writeNotNull('materialesInf', instance.materialesInf);
  writeNotNull('atcs', instance.atcs);
  writeNotNull('principiosActivos', instance.principiosActivos);
  writeNotNull('excipientes', instance.excipientes);
  writeNotNull('viasAdministracion', instance.viasAdministracion);
  writeNotNull('nosustituible', instance.nosustituible);
  writeNotNull('presentaciones', instance.presentaciones);
  writeNotNull('formaFarmaceutica', instance.formaFarmaceutica);
  writeNotNull(
      'formaFarmaceuticaSimplificada', instance.formaFarmaceuticaSimplificada);
  writeNotNull('vtm', instance.vtm);
  writeNotNull('dosis', instance.dosis);
  return val;
}
