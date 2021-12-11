// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cima_paginado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CimaPaginado _$CimaPaginadoFromJson(Map<String, dynamic> json) => CimaPaginado(
      totalFilas: json['totalFilas'] as int?,
      pagina: json['pagina'] as int?,
      tamanioPagina: json['tamanioPagina'] as int?,
      resultados: json['resultados'] as List<dynamic>?,
    );

Map<String, dynamic> _$CimaPaginadoToJson(CimaPaginado instance) =>
    <String, dynamic>{
      'totalFilas': instance.totalFilas,
      'pagina': instance.pagina,
      'tamanioPagina': instance.tamanioPagina,
      'resultados': instance.resultados,
    };
