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

Map<String, dynamic> _$CimaPaginadoToJson(CimaPaginado instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalFilas', instance.totalFilas);
  writeNotNull('pagina', instance.pagina);
  writeNotNull('tamanioPagina', instance.tamanioPagina);
  writeNotNull('resultados', instance.resultados);
  return val;
}
