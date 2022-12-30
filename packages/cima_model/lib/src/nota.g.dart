// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nota _$NotaFromJson(Map<String, dynamic> json) => Nota(
      tipo: json['tipo'] as int?,
      num: json['num'] as String?,
      referencia: json['referencia'] as String?,
      asunto: json['asunto'] as String?,
      fecha: json['fecha'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NotaToJson(Nota instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tipo', instance.tipo);
  writeNotNull('num', instance.num);
  writeNotNull('referencia', instance.referencia);
  writeNotNull('asunto', instance.asunto);
  writeNotNull('fecha', instance.fecha);
  writeNotNull('url', instance.url);
  return val;
}
